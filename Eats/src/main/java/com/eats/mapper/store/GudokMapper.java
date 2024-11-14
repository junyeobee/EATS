package com.eats.mapper.store;

import java.util.List;

import com.eats.store.model.GudokDTO;

public interface GudokMapper {
    public void insertGudok(GudokDTO gudok);
    public void updateNextPaymentDate(GudokDTO gudok);
    public List<GudokDTO> getActiveSubscriptions();
}
