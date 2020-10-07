.pragma library

function formatGitBranchName(prefix, text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = (prefix + "-" + text).replace(/-/g, ' ').replace(/\s{2,}/g, ' ').trim().replace(/\s/g, '-').toLowerCase().replace(/BPRX/ig, 'BPRX').replace(/BPRO/ig, 'BPRO');
}

function formatTaskName(prefix, text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = (prefix + ": " + text).replace(/-/g, ' ').replace(/\s{2,}/g, ' ')
        .replace(/(BPRX|BPRO) (\d{2,5})/ig, '$1-$2')
        .replace(/((BPRX|BPRO)-\d{2,5})(\s*)(?=[^-])/ig, '$1 - ')
        .replace(/BPRX/ig, 'BPRX').replace(/BPRO/ig, 'BPRO').trim();
}

function formatToPlainText(text, textbox) {
    if (!text) {
        textbox.text = '';
        return;
    }

    textbox.text = text.replace(/-/g, ' ').replace(/\s{2,}/g, ' ')
        .replace(/(BPRX|BPRO) (\d{2,5})/ig, '$1-$2')
        .replace(/((BPRX|BPRO)-\d{2,5})(\s*)(?=[^-])/ig, '$1 - ')
        .replace(/BPRX/ig, 'BPRX').replace(/BPRO/ig, 'BPRO').trim();
}
