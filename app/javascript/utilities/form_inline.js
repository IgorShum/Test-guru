document.addEventListener('turbolinks:load', function(){
    $('.form-inline-link').on('click', formInlineLinkHandler)
    var errors = document.querySelector('.resource-errors')

    if (errors){
        var resourceId = errors.dataset.resourceId
        formInLineHandler(resourceId)
    }
})

function formInlineLinkHandler(event){
    event.preventDefault()
    var testId = this.dataset.testId
    formInLineHandler(testId)
}

function formInLineHandler(testId){
    var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
    if (link != null ){
        var $testTitle = $('.test-title[data-test-id="' + testId + '"]')
        var $formInline = $('.form-inline[data-test-id="' + testId + '"]')

        $testTitle.toggle()
        $formInline.toggle()

        if ($formInline.is(':visible') ? link.textContent = 'Cancel' : link.textContent = 'Edit');
    }
}
