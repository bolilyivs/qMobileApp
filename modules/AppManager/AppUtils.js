

function dp(x){
    if(dpi < 120) {
        return x; // Для обычного монитора компьютера
    } else {
        return x*(dpi/160);
    }
}

function createObject(psource, parent){
    var component = Qt.createComponent(psource);
    if(component.status === Component.Ready){
        var object = component.createObject(pparent);
        return object
    }
}
