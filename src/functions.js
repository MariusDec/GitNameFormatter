.pragma library

function formatGitBranchName(prefix, text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = formatMessage(prefix + '-' + text, '-', false);
}

function formatTaskName(prefix, text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = formatMessage(prefix + ': ' + text, ' ', true);
}

function formatToPlainText(text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = formatMessage(text, ' ', true);
}

function formatMessage(text, spaceCharacter = ' ', prettyFormat = false) {
    const regexEscapedSpace = regexEscape(spaceCharacter)

    const trimRegex = new RegExp(`^${regexEscapedSpace}+|${regexEscapedSpace}+$`);
    const taskNameRegex = new RegExp(`(BPRX|BPRO|MTR)${regexEscapedSpace}(\\d{2,5})`, 'g');

    let formattedMessage = text
    .replace(/[\s-]+/g, spaceCharacter)
    .replace(trimRegex, '')
    .replace(/\b(BPRX|BPRO|MTR)\b/ig, (match) => match.toUpperCase())
    .replace(taskNameRegex, '$1-$2');

    if (prettyFormat)
        formattedMessage = formattedMessage.replace(/((BPRX|BPRO|MTR)-\d{2,5})(\s*)(?=[^-])/g, '$1 - ');

    return formattedMessage;
}

function regexEscape(text) {
    return text.replace(/[-[\]{}()*+?.,\\^$|#\s]/g, '\\$&');
}
