.pragma library

function formatGitBranchName(prefix, text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = (prefix + "-" + text).replace(/-/g, ' ').replace(/\s{2,}/g, ' ').trim().replace(/\s/g, '-').toLowerCase();
}

function formatTaskName(prefix, text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = (prefix + ": " + text).replace(/-/g, ' ').replace(/\s{2,}/g, ' ').replace(/(BPRX|BPRO) (\d{3,5})/g, '$1-$2').replace(/((BPRX|BPRO)-\d{3,5})(\s*)(?=[^-])/g, '$1 - ').trim();
}

function formatToPlainText(text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = text.replace(/-/g, ' ').replace(/\s{2,}/g, ' ').replace(/(BPRX|BPRO) (\d{3,5})/g, '$1-$2').replace(/((BPRX|BPRO)-\d{3,5})(\s*)(?=[^-])/g, '$1 - ').trim();
}
