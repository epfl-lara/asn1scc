; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17686 () Bool)

(assert start!17686)

(declare-fun b!85423 () Bool)

(declare-fun e!56898 () Bool)

(declare-datatypes ((array!4062 0))(
  ( (array!4063 (arr!2472 (Array (_ BitVec 32) (_ BitVec 8))) (size!1835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3232 0))(
  ( (BitStream!3233 (buf!2225 array!4062) (currentByte!4422 (_ BitVec 32)) (currentBit!4417 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3232)

(declare-fun array_inv!1681 (array!4062) Bool)

(assert (=> b!85423 (= e!56898 (array_inv!1681 (buf!2225 thiss!1152)))))

(declare-fun b!85424 () Bool)

(declare-fun e!56902 () Bool)

(declare-fun e!56899 () Bool)

(assert (=> b!85424 (= e!56902 e!56899)))

(declare-fun res!70096 () Bool)

(assert (=> b!85424 (=> (not res!70096) (not e!56899))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!134655 () (_ BitVec 64))

(declare-fun lt!134650 () (_ BitVec 64))

(assert (=> b!85424 (= res!70096 (= lt!134655 (bvadd lt!134650 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85424 (= lt!134655 (bitIndex!0 (size!1835 (buf!2225 thiss!1152)) (currentByte!4422 thiss!1152) (currentBit!4417 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3232)

(assert (=> b!85424 (= lt!134650 (bitIndex!0 (size!1835 (buf!2225 thiss!1151)) (currentByte!4422 thiss!1151) (currentBit!4417 thiss!1151)))))

(declare-datatypes ((Unit!5686 0))(
  ( (Unit!5687) )
))
(declare-datatypes ((tuple2!7264 0))(
  ( (tuple2!7265 (_1!3847 Unit!5686) (_2!3847 BitStream!3232)) )
))
(declare-fun lt!134652 () tuple2!7264)

(declare-fun e!56901 () Bool)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun b!85425 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85425 (= e!56901 (validate_offset_bits!1 ((_ sign_extend 32) (size!1835 (buf!2225 (_2!3847 lt!134652)))) ((_ sign_extend 32) (currentByte!4422 (_2!3847 lt!134652))) ((_ sign_extend 32) (currentBit!4417 (_2!3847 lt!134652))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!85426 () Bool)

(declare-fun e!56905 () Bool)

(declare-fun e!56907 () Bool)

(assert (=> b!85426 (= e!56905 e!56907)))

(declare-fun res!70090 () Bool)

(assert (=> b!85426 (=> (not res!70090) (not e!56907))))

(declare-datatypes ((tuple2!7266 0))(
  ( (tuple2!7267 (_1!3848 BitStream!3232) (_2!3848 Bool)) )
))
(declare-fun lt!134654 () tuple2!7266)

(declare-fun lt!134653 () Bool)

(assert (=> b!85426 (= res!70090 (and (= (_2!3848 lt!134654) lt!134653) (= (_1!3848 lt!134654) (_2!3847 lt!134652))))))

(declare-fun readBitPure!0 (BitStream!3232) tuple2!7266)

(declare-fun readerFrom!0 (BitStream!3232 (_ BitVec 32) (_ BitVec 32)) BitStream!3232)

(assert (=> b!85426 (= lt!134654 (readBitPure!0 (readerFrom!0 (_2!3847 lt!134652) (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152))))))

(declare-fun b!85427 () Bool)

(declare-fun lt!134651 () (_ BitVec 64))

(assert (=> b!85427 (= e!56907 (= (bitIndex!0 (size!1835 (buf!2225 (_1!3848 lt!134654))) (currentByte!4422 (_1!3848 lt!134654)) (currentBit!4417 (_1!3848 lt!134654))) lt!134651))))

(declare-fun b!85428 () Bool)

(declare-fun res!70102 () Bool)

(assert (=> b!85428 (=> (not res!70102) (not e!56899))))

(assert (=> b!85428 (= res!70102 (bvslt i!576 nBits!336))))

(declare-fun b!85429 () Bool)

(declare-fun e!56897 () Bool)

(assert (=> b!85429 (= e!56897 (array_inv!1681 (buf!2225 thiss!1151)))))

(declare-fun b!85430 () Bool)

(declare-fun e!56900 () Bool)

(assert (=> b!85430 (= e!56899 (not e!56900))))

(declare-fun res!70093 () Bool)

(assert (=> b!85430 (=> res!70093 e!56900)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85430 (= res!70093 (not (invariant!0 (currentBit!4417 (_2!3847 lt!134652)) (currentByte!4422 (_2!3847 lt!134652)) (size!1835 (buf!2225 (_2!3847 lt!134652))))))))

(declare-fun e!56906 () Bool)

(assert (=> b!85430 e!56906))

(declare-fun res!70101 () Bool)

(assert (=> b!85430 (=> (not res!70101) (not e!56906))))

(assert (=> b!85430 (= res!70101 (= (size!1835 (buf!2225 thiss!1152)) (size!1835 (buf!2225 (_2!3847 lt!134652)))))))

(declare-fun appendBit!0 (BitStream!3232 Bool) tuple2!7264)

(assert (=> b!85430 (= lt!134652 (appendBit!0 thiss!1152 lt!134653))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85430 (= lt!134653 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85431 () Bool)

(declare-fun res!70086 () Bool)

(assert (=> b!85431 (=> res!70086 e!56900)))

(assert (=> b!85431 (= res!70086 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!85432 () Bool)

(declare-fun res!70088 () Bool)

(assert (=> b!85432 (=> (not res!70088) (not e!56905))))

(declare-fun isPrefixOf!0 (BitStream!3232 BitStream!3232) Bool)

(assert (=> b!85432 (= res!70088 (isPrefixOf!0 thiss!1152 (_2!3847 lt!134652)))))

(declare-fun b!85433 () Bool)

(assert (=> b!85433 (= e!56900 e!56901)))

(declare-fun res!70091 () Bool)

(assert (=> b!85433 (=> (not res!70091) (not e!56901))))

(assert (=> b!85433 (= res!70091 (and (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (= (size!1835 (buf!2225 (_2!3847 lt!134652))) (size!1835 (buf!2225 thiss!1151)))))))

(declare-fun res!70097 () Bool)

(assert (=> start!17686 (=> (not res!70097) (not e!56902))))

(assert (=> start!17686 (= res!70097 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17686 e!56902))

(declare-fun inv!12 (BitStream!3232) Bool)

(assert (=> start!17686 (and (inv!12 thiss!1152) e!56898)))

(assert (=> start!17686 (and (inv!12 thiss!1151) e!56897)))

(assert (=> start!17686 true))

(declare-fun b!85434 () Bool)

(declare-fun res!70098 () Bool)

(assert (=> b!85434 (=> (not res!70098) (not e!56902))))

(assert (=> b!85434 (= res!70098 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85435 () Bool)

(declare-fun res!70099 () Bool)

(assert (=> b!85435 (=> (not res!70099) (not e!56902))))

(assert (=> b!85435 (= res!70099 (invariant!0 (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152) (size!1835 (buf!2225 thiss!1152))))))

(declare-fun b!85436 () Bool)

(declare-fun res!70087 () Bool)

(assert (=> b!85436 (=> (not res!70087) (not e!56902))))

(assert (=> b!85436 (= res!70087 (invariant!0 (currentBit!4417 thiss!1151) (currentByte!4422 thiss!1151) (size!1835 (buf!2225 thiss!1151))))))

(declare-fun b!85437 () Bool)

(declare-fun res!70095 () Bool)

(assert (=> b!85437 (=> (not res!70095) (not e!56899))))

(assert (=> b!85437 (= res!70095 (validate_offset_bits!1 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1152))) ((_ sign_extend 32) (currentByte!4422 thiss!1152)) ((_ sign_extend 32) (currentBit!4417 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85438 () Bool)

(declare-fun res!70100 () Bool)

(assert (=> b!85438 (=> (not res!70100) (not e!56901))))

(assert (=> b!85438 (= res!70100 (= (bitIndex!0 (size!1835 (buf!2225 (_2!3847 lt!134652))) (currentByte!4422 (_2!3847 lt!134652)) (currentBit!4417 (_2!3847 lt!134652))) (bvadd lt!134650 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!85439 () Bool)

(declare-fun res!70094 () Bool)

(assert (=> b!85439 (=> (not res!70094) (not e!56902))))

(assert (=> b!85439 (= res!70094 (and (bvsle i!576 nBits!336) (= (size!1835 (buf!2225 thiss!1152)) (size!1835 (buf!2225 thiss!1151)))))))

(declare-fun b!85440 () Bool)

(assert (=> b!85440 (= e!56906 e!56905)))

(declare-fun res!70092 () Bool)

(assert (=> b!85440 (=> (not res!70092) (not e!56905))))

(assert (=> b!85440 (= res!70092 (= lt!134651 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134655)))))

(assert (=> b!85440 (= lt!134651 (bitIndex!0 (size!1835 (buf!2225 (_2!3847 lt!134652))) (currentByte!4422 (_2!3847 lt!134652)) (currentBit!4417 (_2!3847 lt!134652))))))

(declare-fun b!85441 () Bool)

(declare-fun res!70089 () Bool)

(assert (=> b!85441 (=> (not res!70089) (not e!56902))))

(assert (=> b!85441 (= res!70089 (validate_offset_bits!1 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1151))) ((_ sign_extend 32) (currentByte!4422 thiss!1151)) ((_ sign_extend 32) (currentBit!4417 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(assert (= (and start!17686 res!70097) b!85441))

(assert (= (and b!85441 res!70089) b!85436))

(assert (= (and b!85436 res!70087) b!85434))

(assert (= (and b!85434 res!70098) b!85435))

(assert (= (and b!85435 res!70099) b!85439))

(assert (= (and b!85439 res!70094) b!85424))

(assert (= (and b!85424 res!70096) b!85437))

(assert (= (and b!85437 res!70095) b!85428))

(assert (= (and b!85428 res!70102) b!85430))

(assert (= (and b!85430 res!70101) b!85440))

(assert (= (and b!85440 res!70092) b!85432))

(assert (= (and b!85432 res!70088) b!85426))

(assert (= (and b!85426 res!70090) b!85427))

(assert (= (and b!85430 (not res!70093)) b!85431))

(assert (= (and b!85431 (not res!70086)) b!85433))

(assert (= (and b!85433 res!70091) b!85438))

(assert (= (and b!85438 res!70100) b!85425))

(assert (= start!17686 b!85423))

(assert (= start!17686 b!85429))

(declare-fun m!131579 () Bool)

(assert (=> start!17686 m!131579))

(declare-fun m!131581 () Bool)

(assert (=> start!17686 m!131581))

(declare-fun m!131583 () Bool)

(assert (=> b!85425 m!131583))

(declare-fun m!131585 () Bool)

(assert (=> b!85440 m!131585))

(declare-fun m!131587 () Bool)

(assert (=> b!85429 m!131587))

(declare-fun m!131589 () Bool)

(assert (=> b!85426 m!131589))

(assert (=> b!85426 m!131589))

(declare-fun m!131591 () Bool)

(assert (=> b!85426 m!131591))

(declare-fun m!131593 () Bool)

(assert (=> b!85427 m!131593))

(declare-fun m!131595 () Bool)

(assert (=> b!85430 m!131595))

(declare-fun m!131597 () Bool)

(assert (=> b!85430 m!131597))

(declare-fun m!131599 () Bool)

(assert (=> b!85432 m!131599))

(declare-fun m!131601 () Bool)

(assert (=> b!85424 m!131601))

(declare-fun m!131603 () Bool)

(assert (=> b!85424 m!131603))

(declare-fun m!131605 () Bool)

(assert (=> b!85423 m!131605))

(assert (=> b!85438 m!131585))

(declare-fun m!131607 () Bool)

(assert (=> b!85441 m!131607))

(declare-fun m!131609 () Bool)

(assert (=> b!85437 m!131609))

(declare-fun m!131611 () Bool)

(assert (=> b!85435 m!131611))

(declare-fun m!131613 () Bool)

(assert (=> b!85436 m!131613))

(push 1)

(assert (not b!85435))

(assert (not b!85427))

(assert (not b!85436))

(assert (not start!17686))

(assert (not b!85432))

(assert (not b!85426))

(assert (not b!85424))

(assert (not b!85429))

(assert (not b!85425))

(assert (not b!85437))

(assert (not b!85423))

(assert (not b!85430))

(assert (not b!85438))

(assert (not b!85440))

(assert (not b!85441))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!27354 () Bool)

(assert (=> d!27354 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152) (size!1835 (buf!2225 thiss!1152))))))

(declare-fun bs!6776 () Bool)

(assert (= bs!6776 d!27354))

(assert (=> bs!6776 m!131611))

(assert (=> start!17686 d!27354))

(declare-fun d!27356 () Bool)

(assert (=> d!27356 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4417 thiss!1151) (currentByte!4422 thiss!1151) (size!1835 (buf!2225 thiss!1151))))))

(declare-fun bs!6777 () Bool)

(assert (= bs!6777 d!27356))

(assert (=> bs!6777 m!131613))

(assert (=> start!17686 d!27356))

(declare-fun d!27358 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27358 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1151))) ((_ sign_extend 32) (currentByte!4422 thiss!1151)) ((_ sign_extend 32) (currentBit!4417 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1151))) ((_ sign_extend 32) (currentByte!4422 thiss!1151)) ((_ sign_extend 32) (currentBit!4417 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6778 () Bool)

(assert (= bs!6778 d!27358))

(declare-fun m!131703 () Bool)

(assert (=> bs!6778 m!131703))

(assert (=> b!85441 d!27358))

(declare-fun d!27360 () Bool)

(assert (=> d!27360 (= (invariant!0 (currentBit!4417 (_2!3847 lt!134652)) (currentByte!4422 (_2!3847 lt!134652)) (size!1835 (buf!2225 (_2!3847 lt!134652)))) (and (bvsge (currentBit!4417 (_2!3847 lt!134652)) #b00000000000000000000000000000000) (bvslt (currentBit!4417 (_2!3847 lt!134652)) #b00000000000000000000000000001000) (bvsge (currentByte!4422 (_2!3847 lt!134652)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4422 (_2!3847 lt!134652)) (size!1835 (buf!2225 (_2!3847 lt!134652)))) (and (= (currentBit!4417 (_2!3847 lt!134652)) #b00000000000000000000000000000000) (= (currentByte!4422 (_2!3847 lt!134652)) (size!1835 (buf!2225 (_2!3847 lt!134652))))))))))

(assert (=> b!85430 d!27360))

(declare-fun d!27366 () Bool)

(declare-fun e!57006 () Bool)

(assert (=> d!27366 e!57006))

(declare-fun res!70263 () Bool)

(assert (=> d!27366 (=> (not res!70263) (not e!57006))))

(declare-fun lt!134789 () tuple2!7264)

(assert (=> d!27366 (= res!70263 (= (size!1835 (buf!2225 thiss!1152)) (size!1835 (buf!2225 (_2!3847 lt!134789)))))))

(declare-fun choose!16 (BitStream!3232 Bool) tuple2!7264)

(assert (=> d!27366 (= lt!134789 (choose!16 thiss!1152 lt!134653))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!27366 (validate_offset_bit!0 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1152))) ((_ sign_extend 32) (currentByte!4422 thiss!1152)) ((_ sign_extend 32) (currentBit!4417 thiss!1152)))))

(assert (=> d!27366 (= (appendBit!0 thiss!1152 lt!134653) lt!134789)))

(declare-fun b!85614 () Bool)

(declare-fun res!70262 () Bool)

(assert (=> b!85614 (=> (not res!70262) (not e!57006))))

(declare-fun lt!134790 () (_ BitVec 64))

(declare-fun lt!134787 () (_ BitVec 64))

(assert (=> b!85614 (= res!70262 (= (bitIndex!0 (size!1835 (buf!2225 (_2!3847 lt!134789))) (currentByte!4422 (_2!3847 lt!134789)) (currentBit!4417 (_2!3847 lt!134789))) (bvadd lt!134790 lt!134787)))))

(assert (=> b!85614 (or (not (= (bvand lt!134790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134787 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!134790 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!134790 lt!134787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!85614 (= lt!134787 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!85614 (= lt!134790 (bitIndex!0 (size!1835 (buf!2225 thiss!1152)) (currentByte!4422 thiss!1152) (currentBit!4417 thiss!1152)))))

(declare-fun b!85616 () Bool)

(declare-fun e!57005 () Bool)

(assert (=> b!85616 (= e!57006 e!57005)))

(declare-fun res!70264 () Bool)

(assert (=> b!85616 (=> (not res!70264) (not e!57005))))

(declare-fun lt!134788 () tuple2!7266)

(assert (=> b!85616 (= res!70264 (and (= (_2!3848 lt!134788) lt!134653) (= (_1!3848 lt!134788) (_2!3847 lt!134789))))))

(assert (=> b!85616 (= lt!134788 (readBitPure!0 (readerFrom!0 (_2!3847 lt!134789) (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152))))))

(declare-fun b!85617 () Bool)

(assert (=> b!85617 (= e!57005 (= (bitIndex!0 (size!1835 (buf!2225 (_1!3848 lt!134788))) (currentByte!4422 (_1!3848 lt!134788)) (currentBit!4417 (_1!3848 lt!134788))) (bitIndex!0 (size!1835 (buf!2225 (_2!3847 lt!134789))) (currentByte!4422 (_2!3847 lt!134789)) (currentBit!4417 (_2!3847 lt!134789)))))))

(declare-fun b!85615 () Bool)

(declare-fun res!70265 () Bool)

(assert (=> b!85615 (=> (not res!70265) (not e!57006))))

(assert (=> b!85615 (= res!70265 (isPrefixOf!0 thiss!1152 (_2!3847 lt!134789)))))

(assert (= (and d!27366 res!70263) b!85614))

(assert (= (and b!85614 res!70262) b!85615))

(assert (= (and b!85615 res!70265) b!85616))

(assert (= (and b!85616 res!70264) b!85617))

(declare-fun m!131729 () Bool)

(assert (=> d!27366 m!131729))

(declare-fun m!131731 () Bool)

(assert (=> d!27366 m!131731))

(declare-fun m!131733 () Bool)

(assert (=> b!85617 m!131733))

(declare-fun m!131735 () Bool)

(assert (=> b!85617 m!131735))

(declare-fun m!131737 () Bool)

(assert (=> b!85615 m!131737))

(assert (=> b!85614 m!131735))

(assert (=> b!85614 m!131601))

(declare-fun m!131739 () Bool)

(assert (=> b!85616 m!131739))

(assert (=> b!85616 m!131739))

(declare-fun m!131741 () Bool)

(assert (=> b!85616 m!131741))

(assert (=> b!85430 d!27366))

(declare-fun d!27390 () Bool)

(declare-fun e!57015 () Bool)

(assert (=> d!27390 e!57015))

(declare-fun res!70283 () Bool)

(assert (=> d!27390 (=> (not res!70283) (not e!57015))))

(declare-fun lt!134815 () (_ BitVec 64))

(declare-fun lt!134819 () (_ BitVec 64))

(declare-fun lt!134818 () (_ BitVec 64))

(assert (=> d!27390 (= res!70283 (= lt!134819 (bvsub lt!134818 lt!134815)))))

(assert (=> d!27390 (or (= (bvand lt!134818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134818 lt!134815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27390 (= lt!134815 (remainingBits!0 ((_ sign_extend 32) (size!1835 (buf!2225 (_2!3847 lt!134652)))) ((_ sign_extend 32) (currentByte!4422 (_2!3847 lt!134652))) ((_ sign_extend 32) (currentBit!4417 (_2!3847 lt!134652)))))))

(declare-fun lt!134820 () (_ BitVec 64))

(declare-fun lt!134817 () (_ BitVec 64))

(assert (=> d!27390 (= lt!134818 (bvmul lt!134820 lt!134817))))

(assert (=> d!27390 (or (= lt!134820 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134817 (bvsdiv (bvmul lt!134820 lt!134817) lt!134820)))))

(assert (=> d!27390 (= lt!134817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27390 (= lt!134820 ((_ sign_extend 32) (size!1835 (buf!2225 (_2!3847 lt!134652)))))))

(assert (=> d!27390 (= lt!134819 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4422 (_2!3847 lt!134652))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4417 (_2!3847 lt!134652)))))))

(assert (=> d!27390 (invariant!0 (currentBit!4417 (_2!3847 lt!134652)) (currentByte!4422 (_2!3847 lt!134652)) (size!1835 (buf!2225 (_2!3847 lt!134652))))))

(assert (=> d!27390 (= (bitIndex!0 (size!1835 (buf!2225 (_2!3847 lt!134652))) (currentByte!4422 (_2!3847 lt!134652)) (currentBit!4417 (_2!3847 lt!134652))) lt!134819)))

(declare-fun b!85635 () Bool)

(declare-fun res!70282 () Bool)

(assert (=> b!85635 (=> (not res!70282) (not e!57015))))

(assert (=> b!85635 (= res!70282 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134819))))

(declare-fun b!85636 () Bool)

(declare-fun lt!134816 () (_ BitVec 64))

(assert (=> b!85636 (= e!57015 (bvsle lt!134819 (bvmul lt!134816 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85636 (or (= lt!134816 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134816 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134816)))))

(assert (=> b!85636 (= lt!134816 ((_ sign_extend 32) (size!1835 (buf!2225 (_2!3847 lt!134652)))))))

(assert (= (and d!27390 res!70283) b!85635))

(assert (= (and b!85635 res!70282) b!85636))

(declare-fun m!131757 () Bool)

(assert (=> d!27390 m!131757))

(assert (=> d!27390 m!131595))

(assert (=> b!85440 d!27390))

(declare-fun d!27394 () Bool)

(assert (=> d!27394 (= (array_inv!1681 (buf!2225 thiss!1151)) (bvsge (size!1835 (buf!2225 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!85429 d!27394))

(assert (=> b!85438 d!27390))

(declare-fun d!27396 () Bool)

(declare-fun e!57016 () Bool)

(assert (=> d!27396 e!57016))

(declare-fun res!70285 () Bool)

(assert (=> d!27396 (=> (not res!70285) (not e!57016))))

(declare-fun lt!134824 () (_ BitVec 64))

(declare-fun lt!134825 () (_ BitVec 64))

(declare-fun lt!134821 () (_ BitVec 64))

(assert (=> d!27396 (= res!70285 (= lt!134825 (bvsub lt!134824 lt!134821)))))

(assert (=> d!27396 (or (= (bvand lt!134824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134821 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134824 lt!134821) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27396 (= lt!134821 (remainingBits!0 ((_ sign_extend 32) (size!1835 (buf!2225 (_1!3848 lt!134654)))) ((_ sign_extend 32) (currentByte!4422 (_1!3848 lt!134654))) ((_ sign_extend 32) (currentBit!4417 (_1!3848 lt!134654)))))))

(declare-fun lt!134826 () (_ BitVec 64))

(declare-fun lt!134823 () (_ BitVec 64))

(assert (=> d!27396 (= lt!134824 (bvmul lt!134826 lt!134823))))

(assert (=> d!27396 (or (= lt!134826 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134823 (bvsdiv (bvmul lt!134826 lt!134823) lt!134826)))))

(assert (=> d!27396 (= lt!134823 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27396 (= lt!134826 ((_ sign_extend 32) (size!1835 (buf!2225 (_1!3848 lt!134654)))))))

(assert (=> d!27396 (= lt!134825 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4422 (_1!3848 lt!134654))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4417 (_1!3848 lt!134654)))))))

(assert (=> d!27396 (invariant!0 (currentBit!4417 (_1!3848 lt!134654)) (currentByte!4422 (_1!3848 lt!134654)) (size!1835 (buf!2225 (_1!3848 lt!134654))))))

(assert (=> d!27396 (= (bitIndex!0 (size!1835 (buf!2225 (_1!3848 lt!134654))) (currentByte!4422 (_1!3848 lt!134654)) (currentBit!4417 (_1!3848 lt!134654))) lt!134825)))

(declare-fun b!85637 () Bool)

(declare-fun res!70284 () Bool)

(assert (=> b!85637 (=> (not res!70284) (not e!57016))))

(assert (=> b!85637 (= res!70284 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134825))))

(declare-fun b!85638 () Bool)

(declare-fun lt!134822 () (_ BitVec 64))

(assert (=> b!85638 (= e!57016 (bvsle lt!134825 (bvmul lt!134822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85638 (or (= lt!134822 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134822 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134822)))))

(assert (=> b!85638 (= lt!134822 ((_ sign_extend 32) (size!1835 (buf!2225 (_1!3848 lt!134654)))))))

(assert (= (and d!27396 res!70285) b!85637))

(assert (= (and b!85637 res!70284) b!85638))

(declare-fun m!131759 () Bool)

(assert (=> d!27396 m!131759))

(declare-fun m!131761 () Bool)

(assert (=> d!27396 m!131761))

(assert (=> b!85427 d!27396))

(declare-fun d!27398 () Bool)

(assert (=> d!27398 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1152))) ((_ sign_extend 32) (currentByte!4422 thiss!1152)) ((_ sign_extend 32) (currentBit!4417 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1152))) ((_ sign_extend 32) (currentByte!4422 thiss!1152)) ((_ sign_extend 32) (currentBit!4417 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6784 () Bool)

(assert (= bs!6784 d!27398))

(declare-fun m!131763 () Bool)

(assert (=> bs!6784 m!131763))

(assert (=> b!85437 d!27398))

(declare-fun d!27400 () Bool)

(declare-datatypes ((tuple2!7278 0))(
  ( (tuple2!7279 (_1!3854 Bool) (_2!3854 BitStream!3232)) )
))
(declare-fun lt!134829 () tuple2!7278)

(declare-fun readBit!0 (BitStream!3232) tuple2!7278)

(assert (=> d!27400 (= lt!134829 (readBit!0 (readerFrom!0 (_2!3847 lt!134652) (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152))))))

(assert (=> d!27400 (= (readBitPure!0 (readerFrom!0 (_2!3847 lt!134652) (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152))) (tuple2!7267 (_2!3854 lt!134829) (_1!3854 lt!134829)))))

(declare-fun bs!6785 () Bool)

(assert (= bs!6785 d!27400))

(assert (=> bs!6785 m!131589))

(declare-fun m!131765 () Bool)

(assert (=> bs!6785 m!131765))

(assert (=> b!85426 d!27400))

(declare-fun d!27402 () Bool)

(declare-fun e!57025 () Bool)

(assert (=> d!27402 e!57025))

(declare-fun res!70298 () Bool)

(assert (=> d!27402 (=> (not res!70298) (not e!57025))))

(assert (=> d!27402 (= res!70298 (invariant!0 (currentBit!4417 (_2!3847 lt!134652)) (currentByte!4422 (_2!3847 lt!134652)) (size!1835 (buf!2225 (_2!3847 lt!134652)))))))

(assert (=> d!27402 (= (readerFrom!0 (_2!3847 lt!134652) (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152)) (BitStream!3233 (buf!2225 (_2!3847 lt!134652)) (currentByte!4422 thiss!1152) (currentBit!4417 thiss!1152)))))

(declare-fun b!85650 () Bool)

(assert (=> b!85650 (= e!57025 (invariant!0 (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152) (size!1835 (buf!2225 (_2!3847 lt!134652)))))))

(assert (= (and d!27402 res!70298) b!85650))

(assert (=> d!27402 m!131595))

(declare-fun m!131769 () Bool)

(assert (=> b!85650 m!131769))

(assert (=> b!85426 d!27402))

(declare-fun d!27408 () Bool)

(assert (=> d!27408 (= (invariant!0 (currentBit!4417 thiss!1151) (currentByte!4422 thiss!1151) (size!1835 (buf!2225 thiss!1151))) (and (bvsge (currentBit!4417 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4417 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4422 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4422 thiss!1151) (size!1835 (buf!2225 thiss!1151))) (and (= (currentBit!4417 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4422 thiss!1151) (size!1835 (buf!2225 thiss!1151)))))))))

(assert (=> b!85436 d!27408))

(declare-fun d!27410 () Bool)

(assert (=> d!27410 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1835 (buf!2225 (_2!3847 lt!134652)))) ((_ sign_extend 32) (currentByte!4422 (_2!3847 lt!134652))) ((_ sign_extend 32) (currentBit!4417 (_2!3847 lt!134652))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1835 (buf!2225 (_2!3847 lt!134652)))) ((_ sign_extend 32) (currentByte!4422 (_2!3847 lt!134652))) ((_ sign_extend 32) (currentBit!4417 (_2!3847 lt!134652)))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun bs!6786 () Bool)

(assert (= bs!6786 d!27410))

(assert (=> bs!6786 m!131757))

(assert (=> b!85425 d!27410))

(declare-fun d!27412 () Bool)

(assert (=> d!27412 (= (invariant!0 (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152) (size!1835 (buf!2225 thiss!1152))) (and (bvsge (currentBit!4417 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4417 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4422 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4422 thiss!1152) (size!1835 (buf!2225 thiss!1152))) (and (= (currentBit!4417 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4422 thiss!1152) (size!1835 (buf!2225 thiss!1152)))))))))

(assert (=> b!85435 d!27412))

(declare-fun d!27416 () Bool)

(declare-fun e!57026 () Bool)

(assert (=> d!27416 e!57026))

(declare-fun res!70300 () Bool)

(assert (=> d!27416 (=> (not res!70300) (not e!57026))))

(declare-fun lt!134833 () (_ BitVec 64))

(declare-fun lt!134837 () (_ BitVec 64))

(declare-fun lt!134836 () (_ BitVec 64))

(assert (=> d!27416 (= res!70300 (= lt!134837 (bvsub lt!134836 lt!134833)))))

(assert (=> d!27416 (or (= (bvand lt!134836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134833 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134836 lt!134833) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27416 (= lt!134833 (remainingBits!0 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1152))) ((_ sign_extend 32) (currentByte!4422 thiss!1152)) ((_ sign_extend 32) (currentBit!4417 thiss!1152))))))

(declare-fun lt!134838 () (_ BitVec 64))

(declare-fun lt!134835 () (_ BitVec 64))

(assert (=> d!27416 (= lt!134836 (bvmul lt!134838 lt!134835))))

(assert (=> d!27416 (or (= lt!134838 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134835 (bvsdiv (bvmul lt!134838 lt!134835) lt!134838)))))

(assert (=> d!27416 (= lt!134835 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27416 (= lt!134838 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1152))))))

(assert (=> d!27416 (= lt!134837 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4422 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4417 thiss!1152))))))

(assert (=> d!27416 (invariant!0 (currentBit!4417 thiss!1152) (currentByte!4422 thiss!1152) (size!1835 (buf!2225 thiss!1152)))))

(assert (=> d!27416 (= (bitIndex!0 (size!1835 (buf!2225 thiss!1152)) (currentByte!4422 thiss!1152) (currentBit!4417 thiss!1152)) lt!134837)))

(declare-fun b!85651 () Bool)

(declare-fun res!70299 () Bool)

(assert (=> b!85651 (=> (not res!70299) (not e!57026))))

(assert (=> b!85651 (= res!70299 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134837))))

(declare-fun b!85652 () Bool)

(declare-fun lt!134834 () (_ BitVec 64))

(assert (=> b!85652 (= e!57026 (bvsle lt!134837 (bvmul lt!134834 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85652 (or (= lt!134834 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134834 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134834)))))

(assert (=> b!85652 (= lt!134834 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1152))))))

(assert (= (and d!27416 res!70300) b!85651))

(assert (= (and b!85651 res!70299) b!85652))

(assert (=> d!27416 m!131763))

(assert (=> d!27416 m!131611))

(assert (=> b!85424 d!27416))

(declare-fun d!27418 () Bool)

(declare-fun e!57027 () Bool)

(assert (=> d!27418 e!57027))

(declare-fun res!70303 () Bool)

(assert (=> d!27418 (=> (not res!70303) (not e!57027))))

(declare-fun lt!134843 () (_ BitVec 64))

(declare-fun lt!134839 () (_ BitVec 64))

(declare-fun lt!134842 () (_ BitVec 64))

(assert (=> d!27418 (= res!70303 (= lt!134843 (bvsub lt!134842 lt!134839)))))

(assert (=> d!27418 (or (= (bvand lt!134842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!134839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!134842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!134842 lt!134839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27418 (= lt!134839 (remainingBits!0 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1151))) ((_ sign_extend 32) (currentByte!4422 thiss!1151)) ((_ sign_extend 32) (currentBit!4417 thiss!1151))))))

(declare-fun lt!134844 () (_ BitVec 64))

(declare-fun lt!134841 () (_ BitVec 64))

(assert (=> d!27418 (= lt!134842 (bvmul lt!134844 lt!134841))))

(assert (=> d!27418 (or (= lt!134844 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!134841 (bvsdiv (bvmul lt!134844 lt!134841) lt!134844)))))

(assert (=> d!27418 (= lt!134841 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27418 (= lt!134844 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1151))))))

(assert (=> d!27418 (= lt!134843 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4422 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4417 thiss!1151))))))

(assert (=> d!27418 (invariant!0 (currentBit!4417 thiss!1151) (currentByte!4422 thiss!1151) (size!1835 (buf!2225 thiss!1151)))))

(assert (=> d!27418 (= (bitIndex!0 (size!1835 (buf!2225 thiss!1151)) (currentByte!4422 thiss!1151) (currentBit!4417 thiss!1151)) lt!134843)))

(declare-fun b!85653 () Bool)

(declare-fun res!70302 () Bool)

(assert (=> b!85653 (=> (not res!70302) (not e!57027))))

(assert (=> b!85653 (= res!70302 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!134843))))

(declare-fun b!85654 () Bool)

(declare-fun lt!134840 () (_ BitVec 64))

(assert (=> b!85654 (= e!57027 (bvsle lt!134843 (bvmul lt!134840 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!85654 (or (= lt!134840 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!134840 #b0000000000000000000000000000000000000000000000000000000000001000) lt!134840)))))

(assert (=> b!85654 (= lt!134840 ((_ sign_extend 32) (size!1835 (buf!2225 thiss!1151))))))

(assert (= (and d!27418 res!70303) b!85653))

(assert (= (and b!85653 res!70302) b!85654))

(assert (=> d!27418 m!131703))

(assert (=> d!27418 m!131613))

(assert (=> b!85424 d!27418))

(declare-fun d!27420 () Bool)

(assert (=> d!27420 (= (array_inv!1681 (buf!2225 thiss!1152)) (bvsge (size!1835 (buf!2225 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!85423 d!27420))

(declare-fun d!27422 () Bool)

(declare-fun res!70314 () Bool)

(declare-fun e!57036 () Bool)

(assert (=> d!27422 (=> (not res!70314) (not e!57036))))

(assert (=> d!27422 (= res!70314 (= (size!1835 (buf!2225 thiss!1152)) (size!1835 (buf!2225 (_2!3847 lt!134652)))))))

(assert (=> d!27422 (= (isPrefixOf!0 thiss!1152 (_2!3847 lt!134652)) e!57036)))

(declare-fun b!85664 () Bool)

(declare-fun res!70315 () Bool)

(assert (=> b!85664 (=> (not res!70315) (not e!57036))))

(assert (=> b!85664 (= res!70315 (bvsle (bitIndex!0 (size!1835 (buf!2225 thiss!1152)) (currentByte!4422 thiss!1152) (currentBit!4417 thiss!1152)) (bitIndex!0 (size!1835 (buf!2225 (_2!3847 lt!134652))) (currentByte!4422 (_2!3847 lt!134652)) (currentBit!4417 (_2!3847 lt!134652)))))))

(declare-fun b!85665 () Bool)

(declare-fun e!57035 () Bool)

(assert (=> b!85665 (= e!57036 e!57035)))

(declare-fun res!70313 () Bool)

(assert (=> b!85665 (=> res!70313 e!57035)))

(assert (=> b!85665 (= res!70313 (= (size!1835 (buf!2225 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!85666 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4062 array!4062 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85666 (= e!57035 (arrayBitRangesEq!0 (buf!2225 thiss!1152) (buf!2225 (_2!3847 lt!134652)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1835 (buf!2225 thiss!1152)) (currentByte!4422 thiss!1152) (currentBit!4417 thiss!1152))))))

(assert (= (and d!27422 res!70314) b!85664))

(assert (= (and b!85664 res!70315) b!85665))

(assert (= (and b!85665 (not res!70313)) b!85666))

(assert (=> b!85664 m!131601))

(assert (=> b!85664 m!131585))

(assert (=> b!85666 m!131601))

(assert (=> b!85666 m!131601))

(declare-fun m!131775 () Bool)

(assert (=> b!85666 m!131775))

(assert (=> b!85432 d!27422))

(push 1)

(assert (not d!27418))

(assert (not d!27398))

(assert (not d!27366))

(assert (not b!85664))

(assert (not d!27400))

(assert (not d!27416))

(assert (not b!85666))

(assert (not b!85615))

(assert (not d!27354))

(assert (not d!27396))

(assert (not d!27410))

(assert (not d!27358))

(assert (not b!85617))

(assert (not d!27390))

(assert (not b!85614))

(assert (not b!85616))

(assert (not d!27356))

(assert (not b!85650))

(assert (not d!27402))

(check-sat)

(pop 1)

(push 1)

(check-sat)

