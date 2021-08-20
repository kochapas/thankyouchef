import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
    altInput: true,
    altFormat: "F j, Y H:i",
  });
}

export { initFlatpickr };
