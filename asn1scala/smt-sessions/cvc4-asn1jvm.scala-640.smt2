; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17942 () Bool)

(assert start!17942)

(declare-fun b!88328 () Bool)

(declare-fun res!72720 () Bool)

(declare-fun e!58464 () Bool)

(assert (=> b!88328 (=> (not res!72720) (not e!58464))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88328 (= res!72720 (bvslt i!576 nBits!336))))

(declare-fun b!88329 () Bool)

(declare-fun res!72715 () Bool)

(declare-fun e!58465 () Bool)

(assert (=> b!88329 (=> (not res!72715) (not e!58465))))

(declare-datatypes ((array!4159 0))(
  ( (array!4160 (arr!2516 (Array (_ BitVec 32) (_ BitVec 8))) (size!1879 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3320 0))(
  ( (BitStream!3321 (buf!2269 array!4159) (currentByte!4493 (_ BitVec 32)) (currentBit!4488 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3320)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88329 (= res!72715 (validate_offset_bits!1 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1151))) ((_ sign_extend 32) (currentByte!4493 thiss!1151)) ((_ sign_extend 32) (currentBit!4488 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88330 () Bool)

(declare-fun res!72713 () Bool)

(assert (=> b!88330 (=> (not res!72713) (not e!58464))))

(declare-fun thiss!1152 () BitStream!3320)

(assert (=> b!88330 (= res!72713 (validate_offset_bits!1 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1152))) ((_ sign_extend 32) (currentByte!4493 thiss!1152)) ((_ sign_extend 32) (currentBit!4488 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88331 () Bool)

(declare-datatypes ((Unit!5777 0))(
  ( (Unit!5778) )
))
(declare-datatypes ((tuple2!7458 0))(
  ( (tuple2!7459 (_1!3962 Unit!5777) (_2!3962 BitStream!3320)) )
))
(declare-fun lt!136046 () tuple2!7458)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88331 (= e!58464 (not (invariant!0 (currentBit!4488 (_2!3962 lt!136046)) (currentByte!4493 (_2!3962 lt!136046)) (size!1879 (buf!2269 (_2!3962 lt!136046))))))))

(declare-fun e!58467 () Bool)

(assert (=> b!88331 e!58467))

(declare-fun res!72719 () Bool)

(assert (=> b!88331 (=> (not res!72719) (not e!58467))))

(assert (=> b!88331 (= res!72719 (= (size!1879 (buf!2269 thiss!1152)) (size!1879 (buf!2269 (_2!3962 lt!136046)))))))

(declare-fun lt!136048 () Bool)

(declare-fun appendBit!0 (BitStream!3320 Bool) tuple2!7458)

(assert (=> b!88331 (= lt!136046 (appendBit!0 thiss!1152 lt!136048))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!88331 (= lt!136048 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88333 () Bool)

(declare-fun e!58462 () Bool)

(assert (=> b!88333 (= e!58467 e!58462)))

(declare-fun res!72721 () Bool)

(assert (=> b!88333 (=> (not res!72721) (not e!58462))))

(declare-fun lt!136050 () (_ BitVec 64))

(declare-fun lt!136045 () (_ BitVec 64))

(assert (=> b!88333 (= res!72721 (= lt!136050 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136045)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88333 (= lt!136050 (bitIndex!0 (size!1879 (buf!2269 (_2!3962 lt!136046))) (currentByte!4493 (_2!3962 lt!136046)) (currentBit!4488 (_2!3962 lt!136046))))))

(declare-fun b!88334 () Bool)

(declare-fun res!72714 () Bool)

(assert (=> b!88334 (=> (not res!72714) (not e!58465))))

(assert (=> b!88334 (= res!72714 (invariant!0 (currentBit!4488 thiss!1151) (currentByte!4493 thiss!1151) (size!1879 (buf!2269 thiss!1151))))))

(declare-fun b!88335 () Bool)

(declare-fun e!58463 () Bool)

(assert (=> b!88335 (= e!58462 e!58463)))

(declare-fun res!72710 () Bool)

(assert (=> b!88335 (=> (not res!72710) (not e!58463))))

(declare-datatypes ((tuple2!7460 0))(
  ( (tuple2!7461 (_1!3963 BitStream!3320) (_2!3963 Bool)) )
))
(declare-fun lt!136047 () tuple2!7460)

(assert (=> b!88335 (= res!72710 (and (= (_2!3963 lt!136047) lt!136048) (= (_1!3963 lt!136047) (_2!3962 lt!136046))))))

(declare-fun readBitPure!0 (BitStream!3320) tuple2!7460)

(declare-fun readerFrom!0 (BitStream!3320 (_ BitVec 32) (_ BitVec 32)) BitStream!3320)

(assert (=> b!88335 (= lt!136047 (readBitPure!0 (readerFrom!0 (_2!3962 lt!136046) (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152))))))

(declare-fun b!88336 () Bool)

(declare-fun e!58466 () Bool)

(declare-fun array_inv!1725 (array!4159) Bool)

(assert (=> b!88336 (= e!58466 (array_inv!1725 (buf!2269 thiss!1151)))))

(declare-fun b!88337 () Bool)

(declare-fun res!72718 () Bool)

(assert (=> b!88337 (=> (not res!72718) (not e!58465))))

(assert (=> b!88337 (= res!72718 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88338 () Bool)

(assert (=> b!88338 (= e!58463 (= (bitIndex!0 (size!1879 (buf!2269 (_1!3963 lt!136047))) (currentByte!4493 (_1!3963 lt!136047)) (currentBit!4488 (_1!3963 lt!136047))) lt!136050))))

(declare-fun b!88339 () Bool)

(declare-fun res!72709 () Bool)

(assert (=> b!88339 (=> (not res!72709) (not e!58465))))

(assert (=> b!88339 (= res!72709 (invariant!0 (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152) (size!1879 (buf!2269 thiss!1152))))))

(declare-fun b!88340 () Bool)

(declare-fun e!58468 () Bool)

(assert (=> b!88340 (= e!58468 (array_inv!1725 (buf!2269 thiss!1152)))))

(declare-fun b!88332 () Bool)

(declare-fun res!72711 () Bool)

(assert (=> b!88332 (=> (not res!72711) (not e!58462))))

(declare-fun isPrefixOf!0 (BitStream!3320 BitStream!3320) Bool)

(assert (=> b!88332 (= res!72711 (isPrefixOf!0 thiss!1152 (_2!3962 lt!136046)))))

(declare-fun res!72716 () Bool)

(assert (=> start!17942 (=> (not res!72716) (not e!58465))))

(assert (=> start!17942 (= res!72716 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17942 e!58465))

(declare-fun inv!12 (BitStream!3320) Bool)

(assert (=> start!17942 (and (inv!12 thiss!1152) e!58468)))

(assert (=> start!17942 (and (inv!12 thiss!1151) e!58466)))

(assert (=> start!17942 true))

(declare-fun b!88341 () Bool)

(assert (=> b!88341 (= e!58465 e!58464)))

(declare-fun res!72712 () Bool)

(assert (=> b!88341 (=> (not res!72712) (not e!58464))))

(declare-fun lt!136049 () (_ BitVec 64))

(assert (=> b!88341 (= res!72712 (= lt!136045 (bvadd lt!136049 ((_ sign_extend 32) i!576))))))

(assert (=> b!88341 (= lt!136045 (bitIndex!0 (size!1879 (buf!2269 thiss!1152)) (currentByte!4493 thiss!1152) (currentBit!4488 thiss!1152)))))

(assert (=> b!88341 (= lt!136049 (bitIndex!0 (size!1879 (buf!2269 thiss!1151)) (currentByte!4493 thiss!1151) (currentBit!4488 thiss!1151)))))

(declare-fun b!88342 () Bool)

(declare-fun res!72717 () Bool)

(assert (=> b!88342 (=> (not res!72717) (not e!58465))))

(assert (=> b!88342 (= res!72717 (and (bvsle i!576 nBits!336) (= (size!1879 (buf!2269 thiss!1152)) (size!1879 (buf!2269 thiss!1151)))))))

(assert (= (and start!17942 res!72716) b!88329))

(assert (= (and b!88329 res!72715) b!88334))

(assert (= (and b!88334 res!72714) b!88337))

(assert (= (and b!88337 res!72718) b!88339))

(assert (= (and b!88339 res!72709) b!88342))

(assert (= (and b!88342 res!72717) b!88341))

(assert (= (and b!88341 res!72712) b!88330))

(assert (= (and b!88330 res!72713) b!88328))

(assert (= (and b!88328 res!72720) b!88331))

(assert (= (and b!88331 res!72719) b!88333))

(assert (= (and b!88333 res!72721) b!88332))

(assert (= (and b!88332 res!72711) b!88335))

(assert (= (and b!88335 res!72710) b!88338))

(assert (= start!17942 b!88340))

(assert (= start!17942 b!88336))

(declare-fun m!133513 () Bool)

(assert (=> b!88332 m!133513))

(declare-fun m!133515 () Bool)

(assert (=> b!88336 m!133515))

(declare-fun m!133517 () Bool)

(assert (=> b!88331 m!133517))

(declare-fun m!133519 () Bool)

(assert (=> b!88331 m!133519))

(declare-fun m!133521 () Bool)

(assert (=> b!88341 m!133521))

(declare-fun m!133523 () Bool)

(assert (=> b!88341 m!133523))

(declare-fun m!133525 () Bool)

(assert (=> b!88333 m!133525))

(declare-fun m!133527 () Bool)

(assert (=> b!88329 m!133527))

(declare-fun m!133529 () Bool)

(assert (=> b!88334 m!133529))

(declare-fun m!133531 () Bool)

(assert (=> b!88335 m!133531))

(assert (=> b!88335 m!133531))

(declare-fun m!133533 () Bool)

(assert (=> b!88335 m!133533))

(declare-fun m!133535 () Bool)

(assert (=> b!88339 m!133535))

(declare-fun m!133537 () Bool)

(assert (=> b!88340 m!133537))

(declare-fun m!133539 () Bool)

(assert (=> b!88330 m!133539))

(declare-fun m!133541 () Bool)

(assert (=> b!88338 m!133541))

(declare-fun m!133543 () Bool)

(assert (=> start!17942 m!133543))

(declare-fun m!133545 () Bool)

(assert (=> start!17942 m!133545))

(push 1)

(assert (not start!17942))

(assert (not b!88340))

(assert (not b!88334))

(assert (not b!88332))

(assert (not b!88329))

(assert (not b!88338))

(assert (not b!88335))

(assert (not b!88330))

(assert (not b!88339))

(assert (not b!88341))

(assert (not b!88331))

(assert (not b!88333))

(assert (not b!88336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27712 () Bool)

(declare-fun res!72769 () Bool)

(declare-fun e!58499 () Bool)

(assert (=> d!27712 (=> (not res!72769) (not e!58499))))

(assert (=> d!27712 (= res!72769 (= (size!1879 (buf!2269 thiss!1152)) (size!1879 (buf!2269 (_2!3962 lt!136046)))))))

(assert (=> d!27712 (= (isPrefixOf!0 thiss!1152 (_2!3962 lt!136046)) e!58499)))

(declare-fun b!88386 () Bool)

(declare-fun res!72767 () Bool)

(assert (=> b!88386 (=> (not res!72767) (not e!58499))))

(assert (=> b!88386 (= res!72767 (bvsle (bitIndex!0 (size!1879 (buf!2269 thiss!1152)) (currentByte!4493 thiss!1152) (currentBit!4488 thiss!1152)) (bitIndex!0 (size!1879 (buf!2269 (_2!3962 lt!136046))) (currentByte!4493 (_2!3962 lt!136046)) (currentBit!4488 (_2!3962 lt!136046)))))))

(declare-fun b!88387 () Bool)

(declare-fun e!58498 () Bool)

(assert (=> b!88387 (= e!58499 e!58498)))

(declare-fun res!72768 () Bool)

(assert (=> b!88387 (=> res!72768 e!58498)))

(assert (=> b!88387 (= res!72768 (= (size!1879 (buf!2269 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!88388 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4159 array!4159 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88388 (= e!58498 (arrayBitRangesEq!0 (buf!2269 thiss!1152) (buf!2269 (_2!3962 lt!136046)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1879 (buf!2269 thiss!1152)) (currentByte!4493 thiss!1152) (currentBit!4488 thiss!1152))))))

(assert (= (and d!27712 res!72769) b!88386))

(assert (= (and b!88386 res!72767) b!88387))

(assert (= (and b!88387 (not res!72768)) b!88388))

(assert (=> b!88386 m!133521))

(assert (=> b!88386 m!133525))

(assert (=> b!88388 m!133521))

(assert (=> b!88388 m!133521))

(declare-fun m!133577 () Bool)

(assert (=> b!88388 m!133577))

(assert (=> b!88332 d!27712))

(declare-fun d!27714 () Bool)

(assert (=> d!27714 (= (invariant!0 (currentBit!4488 (_2!3962 lt!136046)) (currentByte!4493 (_2!3962 lt!136046)) (size!1879 (buf!2269 (_2!3962 lt!136046)))) (and (bvsge (currentBit!4488 (_2!3962 lt!136046)) #b00000000000000000000000000000000) (bvslt (currentBit!4488 (_2!3962 lt!136046)) #b00000000000000000000000000001000) (bvsge (currentByte!4493 (_2!3962 lt!136046)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4493 (_2!3962 lt!136046)) (size!1879 (buf!2269 (_2!3962 lt!136046)))) (and (= (currentBit!4488 (_2!3962 lt!136046)) #b00000000000000000000000000000000) (= (currentByte!4493 (_2!3962 lt!136046)) (size!1879 (buf!2269 (_2!3962 lt!136046))))))))))

(assert (=> b!88331 d!27714))

(declare-fun b!88416 () Bool)

(declare-fun e!58512 () Bool)

(declare-fun lt!136151 () tuple2!7460)

(declare-fun lt!136149 () tuple2!7458)

(assert (=> b!88416 (= e!58512 (= (bitIndex!0 (size!1879 (buf!2269 (_1!3963 lt!136151))) (currentByte!4493 (_1!3963 lt!136151)) (currentBit!4488 (_1!3963 lt!136151))) (bitIndex!0 (size!1879 (buf!2269 (_2!3962 lt!136149))) (currentByte!4493 (_2!3962 lt!136149)) (currentBit!4488 (_2!3962 lt!136149)))))))

(declare-fun b!88414 () Bool)

(declare-fun res!72794 () Bool)

(declare-fun e!58511 () Bool)

(assert (=> b!88414 (=> (not res!72794) (not e!58511))))

(assert (=> b!88414 (= res!72794 (isPrefixOf!0 thiss!1152 (_2!3962 lt!136149)))))

(declare-fun d!27716 () Bool)

(assert (=> d!27716 e!58511))

(declare-fun res!72795 () Bool)

(assert (=> d!27716 (=> (not res!72795) (not e!58511))))

(assert (=> d!27716 (= res!72795 (= (size!1879 (buf!2269 thiss!1152)) (size!1879 (buf!2269 (_2!3962 lt!136149)))))))

(declare-fun choose!16 (BitStream!3320 Bool) tuple2!7458)

(assert (=> d!27716 (= lt!136149 (choose!16 thiss!1152 lt!136048))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27716 (validate_offset_bit!0 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1152))) ((_ sign_extend 32) (currentByte!4493 thiss!1152)) ((_ sign_extend 32) (currentBit!4488 thiss!1152)))))

(assert (=> d!27716 (= (appendBit!0 thiss!1152 lt!136048) lt!136149)))

(declare-fun b!88415 () Bool)

(assert (=> b!88415 (= e!58511 e!58512)))

(declare-fun res!72792 () Bool)

(assert (=> b!88415 (=> (not res!72792) (not e!58512))))

(assert (=> b!88415 (= res!72792 (and (= (_2!3963 lt!136151) lt!136048) (= (_1!3963 lt!136151) (_2!3962 lt!136149))))))

(assert (=> b!88415 (= lt!136151 (readBitPure!0 (readerFrom!0 (_2!3962 lt!136149) (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152))))))

(declare-fun b!88413 () Bool)

(declare-fun res!72793 () Bool)

(assert (=> b!88413 (=> (not res!72793) (not e!58511))))

(declare-fun lt!136150 () (_ BitVec 64))

(declare-fun lt!136152 () (_ BitVec 64))

(assert (=> b!88413 (= res!72793 (= (bitIndex!0 (size!1879 (buf!2269 (_2!3962 lt!136149))) (currentByte!4493 (_2!3962 lt!136149)) (currentBit!4488 (_2!3962 lt!136149))) (bvadd lt!136150 lt!136152)))))

(assert (=> b!88413 (or (not (= (bvand lt!136150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136152 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136150 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136150 lt!136152) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88413 (= lt!136152 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!88413 (= lt!136150 (bitIndex!0 (size!1879 (buf!2269 thiss!1152)) (currentByte!4493 thiss!1152) (currentBit!4488 thiss!1152)))))

(assert (= (and d!27716 res!72795) b!88413))

(assert (= (and b!88413 res!72793) b!88414))

(assert (= (and b!88414 res!72794) b!88415))

(assert (= (and b!88415 res!72792) b!88416))

(declare-fun m!133593 () Bool)

(assert (=> b!88413 m!133593))

(assert (=> b!88413 m!133521))

(declare-fun m!133595 () Bool)

(assert (=> b!88414 m!133595))

(declare-fun m!133597 () Bool)

(assert (=> d!27716 m!133597))

(declare-fun m!133599 () Bool)

(assert (=> d!27716 m!133599))

(declare-fun m!133601 () Bool)

(assert (=> b!88416 m!133601))

(assert (=> b!88416 m!133593))

(declare-fun m!133603 () Bool)

(assert (=> b!88415 m!133603))

(assert (=> b!88415 m!133603))

(declare-fun m!133605 () Bool)

(assert (=> b!88415 m!133605))

(assert (=> b!88331 d!27716))

(declare-fun d!27744 () Bool)

(declare-fun e!58515 () Bool)

(assert (=> d!27744 e!58515))

(declare-fun res!72800 () Bool)

(assert (=> d!27744 (=> (not res!72800) (not e!58515))))

(declare-fun lt!136165 () (_ BitVec 64))

(declare-fun lt!136168 () (_ BitVec 64))

(declare-fun lt!136167 () (_ BitVec 64))

(assert (=> d!27744 (= res!72800 (= lt!136165 (bvsub lt!136167 lt!136168)))))

(assert (=> d!27744 (or (= (bvand lt!136167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136168 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136167 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136167 lt!136168) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27744 (= lt!136168 (remainingBits!0 ((_ sign_extend 32) (size!1879 (buf!2269 (_2!3962 lt!136046)))) ((_ sign_extend 32) (currentByte!4493 (_2!3962 lt!136046))) ((_ sign_extend 32) (currentBit!4488 (_2!3962 lt!136046)))))))

(declare-fun lt!136169 () (_ BitVec 64))

(declare-fun lt!136170 () (_ BitVec 64))

(assert (=> d!27744 (= lt!136167 (bvmul lt!136169 lt!136170))))

(assert (=> d!27744 (or (= lt!136169 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136170 (bvsdiv (bvmul lt!136169 lt!136170) lt!136169)))))

(assert (=> d!27744 (= lt!136170 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27744 (= lt!136169 ((_ sign_extend 32) (size!1879 (buf!2269 (_2!3962 lt!136046)))))))

(assert (=> d!27744 (= lt!136165 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4493 (_2!3962 lt!136046))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4488 (_2!3962 lt!136046)))))))

(assert (=> d!27744 (invariant!0 (currentBit!4488 (_2!3962 lt!136046)) (currentByte!4493 (_2!3962 lt!136046)) (size!1879 (buf!2269 (_2!3962 lt!136046))))))

(assert (=> d!27744 (= (bitIndex!0 (size!1879 (buf!2269 (_2!3962 lt!136046))) (currentByte!4493 (_2!3962 lt!136046)) (currentBit!4488 (_2!3962 lt!136046))) lt!136165)))

(declare-fun b!88421 () Bool)

(declare-fun res!72801 () Bool)

(assert (=> b!88421 (=> (not res!72801) (not e!58515))))

(assert (=> b!88421 (= res!72801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136165))))

(declare-fun b!88422 () Bool)

(declare-fun lt!136166 () (_ BitVec 64))

(assert (=> b!88422 (= e!58515 (bvsle lt!136165 (bvmul lt!136166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88422 (or (= lt!136166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136166)))))

(assert (=> b!88422 (= lt!136166 ((_ sign_extend 32) (size!1879 (buf!2269 (_2!3962 lt!136046)))))))

(assert (= (and d!27744 res!72800) b!88421))

(assert (= (and b!88421 res!72801) b!88422))

(declare-fun m!133607 () Bool)

(assert (=> d!27744 m!133607))

(assert (=> d!27744 m!133517))

(assert (=> b!88333 d!27744))

(declare-fun d!27746 () Bool)

(assert (=> d!27746 (= (invariant!0 (currentBit!4488 thiss!1151) (currentByte!4493 thiss!1151) (size!1879 (buf!2269 thiss!1151))) (and (bvsge (currentBit!4488 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4488 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4493 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4493 thiss!1151) (size!1879 (buf!2269 thiss!1151))) (and (= (currentBit!4488 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4493 thiss!1151) (size!1879 (buf!2269 thiss!1151)))))))))

(assert (=> b!88334 d!27746))

(declare-fun d!27748 () Bool)

(assert (=> d!27748 (= (array_inv!1725 (buf!2269 thiss!1151)) (bvsge (size!1879 (buf!2269 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88336 d!27748))

(declare-fun d!27750 () Bool)

(declare-datatypes ((tuple2!7466 0))(
  ( (tuple2!7467 (_1!3966 Bool) (_2!3966 BitStream!3320)) )
))
(declare-fun lt!136181 () tuple2!7466)

(declare-fun readBit!0 (BitStream!3320) tuple2!7466)

(assert (=> d!27750 (= lt!136181 (readBit!0 (readerFrom!0 (_2!3962 lt!136046) (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152))))))

(assert (=> d!27750 (= (readBitPure!0 (readerFrom!0 (_2!3962 lt!136046) (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152))) (tuple2!7461 (_2!3966 lt!136181) (_1!3966 lt!136181)))))

(declare-fun bs!6870 () Bool)

(assert (= bs!6870 d!27750))

(assert (=> bs!6870 m!133531))

(declare-fun m!133609 () Bool)

(assert (=> bs!6870 m!133609))

(assert (=> b!88335 d!27750))

(declare-fun d!27752 () Bool)

(declare-fun e!58524 () Bool)

(assert (=> d!27752 e!58524))

(declare-fun res!72817 () Bool)

(assert (=> d!27752 (=> (not res!72817) (not e!58524))))

(assert (=> d!27752 (= res!72817 (invariant!0 (currentBit!4488 (_2!3962 lt!136046)) (currentByte!4493 (_2!3962 lt!136046)) (size!1879 (buf!2269 (_2!3962 lt!136046)))))))

(assert (=> d!27752 (= (readerFrom!0 (_2!3962 lt!136046) (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152)) (BitStream!3321 (buf!2269 (_2!3962 lt!136046)) (currentByte!4493 thiss!1152) (currentBit!4488 thiss!1152)))))

(declare-fun b!88438 () Bool)

(assert (=> b!88438 (= e!58524 (invariant!0 (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152) (size!1879 (buf!2269 (_2!3962 lt!136046)))))))

(assert (= (and d!27752 res!72817) b!88438))

(assert (=> d!27752 m!133517))

(declare-fun m!133625 () Bool)

(assert (=> b!88438 m!133625))

(assert (=> b!88335 d!27752))

(declare-fun d!27756 () Bool)

(declare-fun e!58525 () Bool)

(assert (=> d!27756 e!58525))

(declare-fun res!72818 () Bool)

(assert (=> d!27756 (=> (not res!72818) (not e!58525))))

(declare-fun lt!136186 () (_ BitVec 64))

(declare-fun lt!136188 () (_ BitVec 64))

(declare-fun lt!136189 () (_ BitVec 64))

(assert (=> d!27756 (= res!72818 (= lt!136186 (bvsub lt!136188 lt!136189)))))

(assert (=> d!27756 (or (= (bvand lt!136188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136189 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136188 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136188 lt!136189) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27756 (= lt!136189 (remainingBits!0 ((_ sign_extend 32) (size!1879 (buf!2269 (_1!3963 lt!136047)))) ((_ sign_extend 32) (currentByte!4493 (_1!3963 lt!136047))) ((_ sign_extend 32) (currentBit!4488 (_1!3963 lt!136047)))))))

(declare-fun lt!136190 () (_ BitVec 64))

(declare-fun lt!136191 () (_ BitVec 64))

(assert (=> d!27756 (= lt!136188 (bvmul lt!136190 lt!136191))))

(assert (=> d!27756 (or (= lt!136190 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136191 (bvsdiv (bvmul lt!136190 lt!136191) lt!136190)))))

(assert (=> d!27756 (= lt!136191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27756 (= lt!136190 ((_ sign_extend 32) (size!1879 (buf!2269 (_1!3963 lt!136047)))))))

(assert (=> d!27756 (= lt!136186 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4493 (_1!3963 lt!136047))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4488 (_1!3963 lt!136047)))))))

(assert (=> d!27756 (invariant!0 (currentBit!4488 (_1!3963 lt!136047)) (currentByte!4493 (_1!3963 lt!136047)) (size!1879 (buf!2269 (_1!3963 lt!136047))))))

(assert (=> d!27756 (= (bitIndex!0 (size!1879 (buf!2269 (_1!3963 lt!136047))) (currentByte!4493 (_1!3963 lt!136047)) (currentBit!4488 (_1!3963 lt!136047))) lt!136186)))

(declare-fun b!88439 () Bool)

(declare-fun res!72819 () Bool)

(assert (=> b!88439 (=> (not res!72819) (not e!58525))))

(assert (=> b!88439 (= res!72819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136186))))

(declare-fun b!88440 () Bool)

(declare-fun lt!136187 () (_ BitVec 64))

(assert (=> b!88440 (= e!58525 (bvsle lt!136186 (bvmul lt!136187 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88440 (or (= lt!136187 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136187 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136187)))))

(assert (=> b!88440 (= lt!136187 ((_ sign_extend 32) (size!1879 (buf!2269 (_1!3963 lt!136047)))))))

(assert (= (and d!27756 res!72818) b!88439))

(assert (= (and b!88439 res!72819) b!88440))

(declare-fun m!133627 () Bool)

(assert (=> d!27756 m!133627))

(declare-fun m!133629 () Bool)

(assert (=> d!27756 m!133629))

(assert (=> b!88338 d!27756))

(declare-fun d!27758 () Bool)

(assert (=> d!27758 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1151))) ((_ sign_extend 32) (currentByte!4493 thiss!1151)) ((_ sign_extend 32) (currentBit!4488 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1151))) ((_ sign_extend 32) (currentByte!4493 thiss!1151)) ((_ sign_extend 32) (currentBit!4488 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6871 () Bool)

(assert (= bs!6871 d!27758))

(declare-fun m!133631 () Bool)

(assert (=> bs!6871 m!133631))

(assert (=> b!88329 d!27758))

(declare-fun d!27760 () Bool)

(assert (=> d!27760 (= (array_inv!1725 (buf!2269 thiss!1152)) (bvsge (size!1879 (buf!2269 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88340 d!27760))

(declare-fun d!27762 () Bool)

(assert (=> d!27762 (= (invariant!0 (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152) (size!1879 (buf!2269 thiss!1152))) (and (bvsge (currentBit!4488 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4488 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4493 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4493 thiss!1152) (size!1879 (buf!2269 thiss!1152))) (and (= (currentBit!4488 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4493 thiss!1152) (size!1879 (buf!2269 thiss!1152)))))))))

(assert (=> b!88339 d!27762))

(declare-fun d!27764 () Bool)

(declare-fun e!58526 () Bool)

(assert (=> d!27764 e!58526))

(declare-fun res!72820 () Bool)

(assert (=> d!27764 (=> (not res!72820) (not e!58526))))

(declare-fun lt!136194 () (_ BitVec 64))

(declare-fun lt!136192 () (_ BitVec 64))

(declare-fun lt!136195 () (_ BitVec 64))

(assert (=> d!27764 (= res!72820 (= lt!136192 (bvsub lt!136194 lt!136195)))))

(assert (=> d!27764 (or (= (bvand lt!136194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136194 lt!136195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27764 (= lt!136195 (remainingBits!0 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1152))) ((_ sign_extend 32) (currentByte!4493 thiss!1152)) ((_ sign_extend 32) (currentBit!4488 thiss!1152))))))

(declare-fun lt!136196 () (_ BitVec 64))

(declare-fun lt!136197 () (_ BitVec 64))

(assert (=> d!27764 (= lt!136194 (bvmul lt!136196 lt!136197))))

(assert (=> d!27764 (or (= lt!136196 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136197 (bvsdiv (bvmul lt!136196 lt!136197) lt!136196)))))

(assert (=> d!27764 (= lt!136197 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27764 (= lt!136196 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1152))))))

(assert (=> d!27764 (= lt!136192 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4493 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4488 thiss!1152))))))

(assert (=> d!27764 (invariant!0 (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152) (size!1879 (buf!2269 thiss!1152)))))

(assert (=> d!27764 (= (bitIndex!0 (size!1879 (buf!2269 thiss!1152)) (currentByte!4493 thiss!1152) (currentBit!4488 thiss!1152)) lt!136192)))

(declare-fun b!88441 () Bool)

(declare-fun res!72821 () Bool)

(assert (=> b!88441 (=> (not res!72821) (not e!58526))))

(assert (=> b!88441 (= res!72821 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136192))))

(declare-fun b!88442 () Bool)

(declare-fun lt!136193 () (_ BitVec 64))

(assert (=> b!88442 (= e!58526 (bvsle lt!136192 (bvmul lt!136193 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88442 (or (= lt!136193 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136193 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136193)))))

(assert (=> b!88442 (= lt!136193 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1152))))))

(assert (= (and d!27764 res!72820) b!88441))

(assert (= (and b!88441 res!72821) b!88442))

(declare-fun m!133633 () Bool)

(assert (=> d!27764 m!133633))

(assert (=> d!27764 m!133535))

(assert (=> b!88341 d!27764))

(declare-fun d!27766 () Bool)

(declare-fun e!58527 () Bool)

(assert (=> d!27766 e!58527))

(declare-fun res!72822 () Bool)

(assert (=> d!27766 (=> (not res!72822) (not e!58527))))

(declare-fun lt!136198 () (_ BitVec 64))

(declare-fun lt!136201 () (_ BitVec 64))

(declare-fun lt!136200 () (_ BitVec 64))

(assert (=> d!27766 (= res!72822 (= lt!136198 (bvsub lt!136200 lt!136201)))))

(assert (=> d!27766 (or (= (bvand lt!136200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136200 lt!136201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27766 (= lt!136201 (remainingBits!0 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1151))) ((_ sign_extend 32) (currentByte!4493 thiss!1151)) ((_ sign_extend 32) (currentBit!4488 thiss!1151))))))

(declare-fun lt!136202 () (_ BitVec 64))

(declare-fun lt!136203 () (_ BitVec 64))

(assert (=> d!27766 (= lt!136200 (bvmul lt!136202 lt!136203))))

(assert (=> d!27766 (or (= lt!136202 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136203 (bvsdiv (bvmul lt!136202 lt!136203) lt!136202)))))

(assert (=> d!27766 (= lt!136203 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27766 (= lt!136202 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1151))))))

(assert (=> d!27766 (= lt!136198 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4493 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4488 thiss!1151))))))

(assert (=> d!27766 (invariant!0 (currentBit!4488 thiss!1151) (currentByte!4493 thiss!1151) (size!1879 (buf!2269 thiss!1151)))))

(assert (=> d!27766 (= (bitIndex!0 (size!1879 (buf!2269 thiss!1151)) (currentByte!4493 thiss!1151) (currentBit!4488 thiss!1151)) lt!136198)))

(declare-fun b!88443 () Bool)

(declare-fun res!72823 () Bool)

(assert (=> b!88443 (=> (not res!72823) (not e!58527))))

(assert (=> b!88443 (= res!72823 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136198))))

(declare-fun b!88444 () Bool)

(declare-fun lt!136199 () (_ BitVec 64))

(assert (=> b!88444 (= e!58527 (bvsle lt!136198 (bvmul lt!136199 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88444 (or (= lt!136199 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136199 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136199)))))

(assert (=> b!88444 (= lt!136199 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1151))))))

(assert (= (and d!27766 res!72822) b!88443))

(assert (= (and b!88443 res!72823) b!88444))

(assert (=> d!27766 m!133631))

(assert (=> d!27766 m!133529))

(assert (=> b!88341 d!27766))

(declare-fun d!27768 () Bool)

(assert (=> d!27768 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4488 thiss!1152) (currentByte!4493 thiss!1152) (size!1879 (buf!2269 thiss!1152))))))

(declare-fun bs!6872 () Bool)

(assert (= bs!6872 d!27768))

(assert (=> bs!6872 m!133535))

(assert (=> start!17942 d!27768))

(declare-fun d!27770 () Bool)

(assert (=> d!27770 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4488 thiss!1151) (currentByte!4493 thiss!1151) (size!1879 (buf!2269 thiss!1151))))))

(declare-fun bs!6873 () Bool)

(assert (= bs!6873 d!27770))

(assert (=> bs!6873 m!133529))

(assert (=> start!17942 d!27770))

(declare-fun d!27772 () Bool)

(assert (=> d!27772 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1152))) ((_ sign_extend 32) (currentByte!4493 thiss!1152)) ((_ sign_extend 32) (currentBit!4488 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1879 (buf!2269 thiss!1152))) ((_ sign_extend 32) (currentByte!4493 thiss!1152)) ((_ sign_extend 32) (currentBit!4488 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6874 () Bool)

(assert (= bs!6874 d!27772))

(assert (=> bs!6874 m!133633))

(assert (=> b!88330 d!27772))

(push 1)

