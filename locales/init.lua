Locales = {}

function _U(str, ...)
    if Locales[cfg.locale] and Locales[cfg.locale][str] then
        return string.format(Locales[cfg.locale][str], ...)
    else
        return 'Translation [' .. cfg.locale .. '][' .. str .. '] does not exist'
    end
end

function _L(str, ...)
    return _U(str, ...)
end
