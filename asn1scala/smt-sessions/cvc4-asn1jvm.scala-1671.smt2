; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46632 () Bool)

(assert start!46632)

(declare-fun res!187841 () Bool)

(declare-fun e!152331 () Bool)

(assert (=> start!46632 (=> (not res!187841) (not e!152331))))

(declare-datatypes ((array!10993 0))(
  ( (array!10994 (arr!5766 (Array (_ BitVec 32) (_ BitVec 8))) (size!4821 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!10993)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!46632 (= res!187841 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4821 arr!308))))))

(assert (=> start!46632 e!152331))

(assert (=> start!46632 true))

(declare-fun array_inv!4562 (array!10993) Bool)

(assert (=> start!46632 (array_inv!4562 arr!308)))

(declare-datatypes ((BitStream!8744 0))(
  ( (BitStream!8745 (buf!5365 array!10993) (currentByte!10084 (_ BitVec 32)) (currentBit!10079 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8744)

(declare-fun e!152333 () Bool)

(declare-fun inv!12 (BitStream!8744) Bool)

(assert (=> start!46632 (and (inv!12 thiss!1870) e!152333)))

(declare-fun b!223756 () Bool)

(declare-datatypes ((Unit!16278 0))(
  ( (Unit!16279) )
))
(declare-datatypes ((tuple3!1168 0))(
  ( (tuple3!1169 (_1!10285 Unit!16278) (_2!10285 BitStream!8744) (_3!726 array!10993)) )
))
(declare-fun lt!354409 () tuple3!1168)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223756 (= e!152331 (not (invariant!0 (currentBit!10079 (_2!10285 lt!354409)) (currentByte!10084 (_2!10285 lt!354409)) (size!4821 (buf!5365 (_2!10285 lt!354409))))))))

(declare-fun e!152332 () Bool)

(assert (=> b!223756 e!152332))

(declare-fun res!187842 () Bool)

(assert (=> b!223756 (=> (not res!187842) (not e!152332))))

(declare-fun lt!354414 () (_ BitVec 64))

(declare-fun lt!354412 () (_ BitVec 64))

(assert (=> b!223756 (= res!187842 (= lt!354414 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!354412)))))

(declare-datatypes ((tuple2!19118 0))(
  ( (tuple2!19119 (_1!10286 (_ BitVec 8)) (_2!10286 BitStream!8744)) )
))
(declare-fun lt!354413 () tuple2!19118)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!223756 (= lt!354414 (bitIndex!0 (size!4821 (buf!5365 (_2!10286 lt!354413))) (currentByte!10084 (_2!10286 lt!354413)) (currentBit!10079 (_2!10286 lt!354413))))))

(assert (=> b!223756 (= lt!354412 (bitIndex!0 (size!4821 (buf!5365 thiss!1870)) (currentByte!10084 thiss!1870) (currentBit!10079 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!8744 array!10993 (_ BitVec 32) (_ BitVec 32)) tuple3!1168)

(assert (=> b!223756 (= lt!354409 (readByteArrayLoop!0 (_2!10286 lt!354413) (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354410 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!223756 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354413)))) ((_ sign_extend 32) (currentByte!10084 (_2!10286 lt!354413))) ((_ sign_extend 32) (currentBit!10079 (_2!10286 lt!354413))) lt!354410)))

(assert (=> b!223756 (= lt!354410 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!354411 () Unit!16278)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!8744 BitStream!8744 (_ BitVec 64) (_ BitVec 32)) Unit!16278)

(assert (=> b!223756 (= lt!354411 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10286 lt!354413) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!8744) tuple2!19118)

(assert (=> b!223756 (= lt!354413 (readByte!0 thiss!1870))))

(declare-fun b!223757 () Bool)

(assert (=> b!223757 (= e!152333 (array_inv!4562 (buf!5365 thiss!1870)))))

(declare-fun b!223758 () Bool)

(declare-fun res!187839 () Bool)

(assert (=> b!223758 (=> (not res!187839) (not e!152331))))

(assert (=> b!223758 (= res!187839 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4821 (buf!5365 thiss!1870))) ((_ sign_extend 32) (currentByte!10084 thiss!1870)) ((_ sign_extend 32) (currentBit!10079 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!223759 () Bool)

(assert (=> b!223759 (= e!152332 (= (bvadd lt!354414 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!354410))) (bitIndex!0 (size!4821 (buf!5365 (_2!10285 lt!354409))) (currentByte!10084 (_2!10285 lt!354409)) (currentBit!10079 (_2!10285 lt!354409)))))))

(declare-fun b!223760 () Bool)

(declare-fun res!187840 () Bool)

(assert (=> b!223760 (=> (not res!187840) (not e!152331))))

(assert (=> b!223760 (= res!187840 (bvslt i!761 to!496))))

(assert (= (and start!46632 res!187841) b!223758))

(assert (= (and b!223758 res!187839) b!223760))

(assert (= (and b!223760 res!187840) b!223756))

(assert (= (and b!223756 res!187842) b!223759))

(assert (= start!46632 b!223757))

(declare-fun m!342993 () Bool)

(assert (=> b!223756 m!342993))

(declare-fun m!342995 () Bool)

(assert (=> b!223756 m!342995))

(declare-fun m!342997 () Bool)

(assert (=> b!223756 m!342997))

(declare-fun m!342999 () Bool)

(assert (=> b!223756 m!342999))

(declare-fun m!343001 () Bool)

(assert (=> b!223756 m!343001))

(declare-fun m!343003 () Bool)

(assert (=> b!223756 m!343003))

(declare-fun m!343005 () Bool)

(assert (=> b!223756 m!343005))

(declare-fun m!343007 () Bool)

(assert (=> b!223756 m!343007))

(declare-fun m!343009 () Bool)

(assert (=> start!46632 m!343009))

(declare-fun m!343011 () Bool)

(assert (=> start!46632 m!343011))

(declare-fun m!343013 () Bool)

(assert (=> b!223757 m!343013))

(declare-fun m!343015 () Bool)

(assert (=> b!223758 m!343015))

(declare-fun m!343017 () Bool)

(assert (=> b!223759 m!343017))

(push 1)

(assert (not start!46632))

(assert (not b!223759))

(assert (not b!223756))

(assert (not b!223758))

(assert (not b!223757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75926 () Bool)

(declare-fun e!152336 () Bool)

(assert (=> d!75926 e!152336))

(declare-fun res!187845 () Bool)

(assert (=> d!75926 (=> (not res!187845) (not e!152336))))

(assert (=> d!75926 (= res!187845 (and (or (let ((rhs!3707 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3707 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3707) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!75927 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!75927 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!75927 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3706 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3706 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3706) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!354423 () Unit!16278)

(declare-fun choose!57 (BitStream!8744 BitStream!8744 (_ BitVec 64) (_ BitVec 32)) Unit!16278)

(assert (=> d!75926 (= lt!354423 (choose!57 thiss!1870 (_2!10286 lt!354413) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!75926 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10286 lt!354413) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!354423)))

(declare-fun lt!354422 () (_ BitVec 32))

(declare-fun b!223763 () Bool)

(assert (=> b!223763 (= e!152336 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354413)))) ((_ sign_extend 32) (currentByte!10084 (_2!10286 lt!354413))) ((_ sign_extend 32) (currentBit!10079 (_2!10286 lt!354413))) (bvsub (bvsub to!496 i!761) lt!354422)))))

(assert (=> b!223763 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!354422 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!354422) #b10000000000000000000000000000000)))))

(declare-fun lt!354421 () (_ BitVec 64))

(assert (=> b!223763 (= lt!354422 ((_ extract 31 0) lt!354421))))

(assert (=> b!223763 (and (bvslt lt!354421 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!354421 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!223763 (= lt!354421 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!75926 res!187845) b!223763))

(declare-fun m!343019 () Bool)

(assert (=> d!75926 m!343019))

(declare-fun m!343021 () Bool)

(assert (=> b!223763 m!343021))

(assert (=> b!223756 d!75926))

(declare-fun d!75931 () Bool)

(declare-fun lt!354456 () (_ BitVec 8))

(declare-fun lt!354458 () (_ BitVec 8))

(assert (=> d!75931 (= lt!354456 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5766 (buf!5365 thiss!1870)) (currentByte!10084 thiss!1870))) ((_ sign_extend 24) lt!354458))))))

(assert (=> d!75931 (= lt!354458 ((_ extract 7 0) (currentBit!10079 thiss!1870)))))

(declare-fun e!152344 () Bool)

(assert (=> d!75931 e!152344))

(declare-fun res!187858 () Bool)

(assert (=> d!75931 (=> (not res!187858) (not e!152344))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!75931 (= res!187858 (validate_offset_bits!1 ((_ sign_extend 32) (size!4821 (buf!5365 thiss!1870))) ((_ sign_extend 32) (currentByte!10084 thiss!1870)) ((_ sign_extend 32) (currentBit!10079 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19120 0))(
  ( (tuple2!19121 (_1!10287 Unit!16278) (_2!10287 (_ BitVec 8))) )
))
(declare-fun Unit!16280 () Unit!16278)

(declare-fun Unit!16281 () Unit!16278)

(assert (=> d!75931 (= (readByte!0 thiss!1870) (tuple2!19119 (_2!10287 (ite (bvsgt ((_ sign_extend 24) lt!354458) #b00000000000000000000000000000000) (tuple2!19121 Unit!16280 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354456) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5766 (buf!5365 thiss!1870)) (bvadd (currentByte!10084 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354458)))))))) (tuple2!19121 Unit!16281 lt!354456))) (BitStream!8745 (buf!5365 thiss!1870) (bvadd (currentByte!10084 thiss!1870) #b00000000000000000000000000000001) (currentBit!10079 thiss!1870))))))

(declare-fun b!223774 () Bool)

(declare-fun e!152345 () Bool)

(assert (=> b!223774 (= e!152344 e!152345)))

(declare-fun res!187859 () Bool)

(assert (=> b!223774 (=> (not res!187859) (not e!152345))))

(declare-fun lt!354461 () tuple2!19118)

(assert (=> b!223774 (= res!187859 (= (buf!5365 (_2!10286 lt!354461)) (buf!5365 thiss!1870)))))

(declare-fun lt!354459 () (_ BitVec 8))

(declare-fun lt!354457 () (_ BitVec 8))

(declare-fun Unit!16282 () Unit!16278)

(declare-fun Unit!16283 () Unit!16278)

(assert (=> b!223774 (= lt!354461 (tuple2!19119 (_2!10287 (ite (bvsgt ((_ sign_extend 24) lt!354457) #b00000000000000000000000000000000) (tuple2!19121 Unit!16282 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!354459) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5766 (buf!5365 thiss!1870)) (bvadd (currentByte!10084 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!354457)))))))) (tuple2!19121 Unit!16283 lt!354459))) (BitStream!8745 (buf!5365 thiss!1870) (bvadd (currentByte!10084 thiss!1870) #b00000000000000000000000000000001) (currentBit!10079 thiss!1870))))))

(assert (=> b!223774 (= lt!354459 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5766 (buf!5365 thiss!1870)) (currentByte!10084 thiss!1870))) ((_ sign_extend 24) lt!354457))))))

(assert (=> b!223774 (= lt!354457 ((_ extract 7 0) (currentBit!10079 thiss!1870)))))

(declare-fun lt!354460 () (_ BitVec 64))

(declare-fun b!223775 () Bool)

(declare-fun lt!354462 () (_ BitVec 64))

(assert (=> b!223775 (= e!152345 (= (bitIndex!0 (size!4821 (buf!5365 (_2!10286 lt!354461))) (currentByte!10084 (_2!10286 lt!354461)) (currentBit!10079 (_2!10286 lt!354461))) (bvadd lt!354460 lt!354462)))))

(assert (=> b!223775 (or (not (= (bvand lt!354460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354462 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354460 lt!354462) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!223775 (= lt!354462 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!223775 (= lt!354460 (bitIndex!0 (size!4821 (buf!5365 thiss!1870)) (currentByte!10084 thiss!1870) (currentBit!10079 thiss!1870)))))

(assert (= (and d!75931 res!187858) b!223774))

(assert (= (and b!223774 res!187859) b!223775))

(declare-fun m!343027 () Bool)

(assert (=> d!75931 m!343027))

(declare-fun m!343029 () Bool)

(assert (=> d!75931 m!343029))

(declare-fun m!343031 () Bool)

(assert (=> d!75931 m!343031))

(assert (=> b!223774 m!343031))

(assert (=> b!223774 m!343027))

(declare-fun m!343033 () Bool)

(assert (=> b!223775 m!343033))

(assert (=> b!223775 m!343005))

(assert (=> b!223756 d!75931))

(declare-fun bm!3562 () Bool)

(declare-fun call!3566 () (_ BitVec 64))

(assert (=> bm!3562 (= call!3566 (bitIndex!0 (size!4821 (buf!5365 (_2!10286 lt!354413))) (currentByte!10084 (_2!10286 lt!354413)) (currentBit!10079 (_2!10286 lt!354413))))))

(declare-fun lt!354623 () tuple3!1168)

(declare-fun b!223813 () Bool)

(declare-fun e!152375 () Bool)

(declare-fun arrayRangesEq!718 (array!10993 array!10993 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223813 (= e!152375 (arrayRangesEq!718 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) (_3!726 lt!354623) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun c!11116 () Bool)

(declare-fun call!3565 () Bool)

(declare-fun lt!354653 () tuple3!1168)

(declare-fun bm!3563 () Bool)

(declare-fun lt!354647 () (_ BitVec 32))

(assert (=> bm!3563 (= call!3565 (arrayRangesEq!718 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) (ite c!11116 (_3!726 lt!354653) (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))) (ite c!11116 lt!354647 #b00000000000000000000000000000000) (ite c!11116 (bvadd #b00000000000000000000000000000001 i!761) (size!4821 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))))))))

(declare-fun e!152373 () Bool)

(declare-fun b!223814 () Bool)

(declare-datatypes ((tuple2!19122 0))(
  ( (tuple2!19123 (_1!10288 BitStream!8744) (_2!10288 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!8744) tuple2!19122)

(assert (=> b!223814 (= e!152373 (= (select (arr!5766 (_3!726 lt!354623)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10288 (readBytePure!0 (_2!10286 lt!354413)))))))

(assert (=> b!223814 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4821 (_3!726 lt!354623))))))

(declare-fun lt!354622 () (_ BitVec 32))

(declare-fun bm!3564 () Bool)

(declare-fun lt!354626 () array!10993)

(declare-fun lt!354641 () (_ BitVec 32))

(declare-fun lt!354633 () array!10993)

(declare-fun call!3567 () Bool)

(assert (=> bm!3564 (= call!3567 (arrayRangesEq!718 (ite c!11116 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) lt!354633) (ite c!11116 (_3!726 lt!354653) lt!354626) (ite c!11116 #b00000000000000000000000000000000 lt!354641) (ite c!11116 (bvadd #b00000000000000000000000000000001 i!761) lt!354622)))))

(declare-fun b!223815 () Bool)

(declare-fun res!187894 () Bool)

(assert (=> b!223815 (=> (not res!187894) (not e!152375))))

(assert (=> b!223815 (= res!187894 (and (= (buf!5365 (_2!10286 lt!354413)) (buf!5365 (_2!10285 lt!354623))) (= (size!4821 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))) (size!4821 (_3!726 lt!354623)))))))

(declare-fun lt!354643 () Unit!16278)

(declare-fun b!223817 () Bool)

(declare-fun e!152374 () tuple3!1168)

(assert (=> b!223817 (= e!152374 (tuple3!1169 lt!354643 (_2!10286 lt!354413) (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))))))

(assert (=> b!223817 (= call!3566 call!3566)))

(declare-fun lt!354640 () Unit!16278)

(declare-fun Unit!16284 () Unit!16278)

(assert (=> b!223817 (= lt!354640 Unit!16284)))

(declare-fun lt!354632 () Unit!16278)

(declare-fun arrayRangesEqReflexiveLemma!71 (array!10993) Unit!16278)

(assert (=> b!223817 (= lt!354632 (arrayRangesEqReflexiveLemma!71 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))))))

(assert (=> b!223817 call!3565))

(declare-fun lt!354634 () Unit!16278)

(assert (=> b!223817 (= lt!354634 lt!354632)))

(assert (=> b!223817 (= lt!354633 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)))))

(assert (=> b!223817 (= lt!354626 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)))))

(declare-fun lt!354627 () (_ BitVec 32))

(assert (=> b!223817 (= lt!354627 #b00000000000000000000000000000000)))

(declare-fun lt!354650 () (_ BitVec 32))

(assert (=> b!223817 (= lt!354650 (size!4821 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))))))

(assert (=> b!223817 (= lt!354641 #b00000000000000000000000000000000)))

(assert (=> b!223817 (= lt!354622 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!71 (array!10993 array!10993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16278)

(assert (=> b!223817 (= lt!354643 (arrayRangesEqSlicedLemma!71 lt!354633 lt!354626 lt!354627 lt!354650 lt!354641 lt!354622))))

(assert (=> b!223817 call!3567))

(declare-fun b!223816 () Bool)

(declare-fun lt!354642 () Unit!16278)

(assert (=> b!223816 (= e!152374 (tuple3!1169 lt!354642 (_2!10285 lt!354653) (_3!726 lt!354653)))))

(declare-fun lt!354637 () tuple2!19118)

(assert (=> b!223816 (= lt!354637 (readByte!0 (_2!10286 lt!354413)))))

(declare-fun lt!354628 () array!10993)

(assert (=> b!223816 (= lt!354628 (array!10994 (store (arr!5766 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10286 lt!354637)) (size!4821 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)))))))

(declare-fun lt!354649 () (_ BitVec 64))

(assert (=> b!223816 (= lt!354649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!354635 () (_ BitVec 32))

(assert (=> b!223816 (= lt!354635 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354636 () Unit!16278)

(assert (=> b!223816 (= lt!354636 (validateOffsetBytesFromBitIndexLemma!0 (_2!10286 lt!354413) (_2!10286 lt!354637) lt!354649 lt!354635))))

(assert (=> b!223816 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354637)))) ((_ sign_extend 32) (currentByte!10084 (_2!10286 lt!354637))) ((_ sign_extend 32) (currentBit!10079 (_2!10286 lt!354637))) (bvsub lt!354635 ((_ extract 31 0) (bvsdiv (bvadd lt!354649 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!354625 () Unit!16278)

(assert (=> b!223816 (= lt!354625 lt!354636)))

(assert (=> b!223816 (= lt!354653 (readByteArrayLoop!0 (_2!10286 lt!354637) lt!354628 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(assert (=> b!223816 (= (bitIndex!0 (size!4821 (buf!5365 (_2!10286 lt!354637))) (currentByte!10084 (_2!10286 lt!354637)) (currentBit!10079 (_2!10286 lt!354637))) (bvadd call!3566 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!354624 () Unit!16278)

(declare-fun Unit!16285 () Unit!16278)

(assert (=> b!223816 (= lt!354624 Unit!16285)))

(assert (=> b!223816 (= (bvadd (bitIndex!0 (size!4821 (buf!5365 (_2!10286 lt!354637))) (currentByte!10084 (_2!10286 lt!354637)) (currentBit!10079 (_2!10286 lt!354637))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4821 (buf!5365 (_2!10285 lt!354653))) (currentByte!10084 (_2!10285 lt!354653)) (currentBit!10079 (_2!10285 lt!354653))))))

(declare-fun lt!354657 () Unit!16278)

(declare-fun Unit!16286 () Unit!16278)

(assert (=> b!223816 (= lt!354657 Unit!16286)))

(assert (=> b!223816 (= (bvadd call!3566 (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4821 (buf!5365 (_2!10285 lt!354653))) (currentByte!10084 (_2!10285 lt!354653)) (currentBit!10079 (_2!10285 lt!354653))))))

(declare-fun lt!354654 () Unit!16278)

(declare-fun Unit!16289 () Unit!16278)

(assert (=> b!223816 (= lt!354654 Unit!16289)))

(assert (=> b!223816 (and (= (buf!5365 (_2!10286 lt!354413)) (buf!5365 (_2!10285 lt!354653))) (= (size!4821 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))) (size!4821 (_3!726 lt!354653))))))

(declare-fun lt!354639 () Unit!16278)

(declare-fun Unit!16292 () Unit!16278)

(assert (=> b!223816 (= lt!354639 Unit!16292)))

(declare-fun lt!354638 () Unit!16278)

(declare-fun arrayUpdatedAtPrefixLemma!310 (array!10993 (_ BitVec 32) (_ BitVec 8)) Unit!16278)

(assert (=> b!223816 (= lt!354638 (arrayUpdatedAtPrefixLemma!310 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10286 lt!354637)))))

(assert (=> b!223816 (arrayRangesEq!718 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) (array!10994 (store (arr!5766 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10286 lt!354637)) (size!4821 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!354644 () Unit!16278)

(assert (=> b!223816 (= lt!354644 lt!354638)))

(assert (=> b!223816 (= lt!354647 #b00000000000000000000000000000000)))

(declare-fun lt!354648 () Unit!16278)

(declare-fun arrayRangesEqTransitive!204 (array!10993 array!10993 array!10993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16278)

(assert (=> b!223816 (= lt!354648 (arrayRangesEqTransitive!204 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) lt!354628 (_3!726 lt!354653) lt!354647 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223816 call!3565))

(declare-fun lt!354656 () Unit!16278)

(assert (=> b!223816 (= lt!354656 lt!354648)))

(assert (=> b!223816 call!3567))

(declare-fun lt!354629 () Unit!16278)

(declare-fun Unit!16293 () Unit!16278)

(assert (=> b!223816 (= lt!354629 Unit!16293)))

(declare-fun lt!354651 () Unit!16278)

(declare-fun arrayRangesEqImpliesEq!79 (array!10993 array!10993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16278)

(assert (=> b!223816 (= lt!354651 (arrayRangesEqImpliesEq!79 lt!354628 (_3!726 lt!354653) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!223816 (= (select (store (arr!5766 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10286 lt!354637)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5766 (_3!726 lt!354653)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!354655 () Unit!16278)

(assert (=> b!223816 (= lt!354655 lt!354651)))

(declare-fun lt!354645 () Bool)

(assert (=> b!223816 (= lt!354645 (= (select (arr!5766 (_3!726 lt!354653)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10286 lt!354637)))))

(declare-fun Unit!16294 () Unit!16278)

(assert (=> b!223816 (= lt!354642 Unit!16294)))

(assert (=> b!223816 lt!354645))

(declare-fun d!75939 () Bool)

(assert (=> d!75939 e!152373))

(declare-fun res!187896 () Bool)

(assert (=> d!75939 (=> res!187896 e!152373)))

(assert (=> d!75939 (= res!187896 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!354646 () Bool)

(assert (=> d!75939 (= lt!354646 e!152375)))

(declare-fun res!187895 () Bool)

(assert (=> d!75939 (=> (not res!187895) (not e!152375))))

(declare-fun lt!354630 () (_ BitVec 64))

(declare-fun lt!354631 () (_ BitVec 64))

(assert (=> d!75939 (= res!187895 (= (bvadd lt!354631 lt!354630) (bitIndex!0 (size!4821 (buf!5365 (_2!10285 lt!354623))) (currentByte!10084 (_2!10285 lt!354623)) (currentBit!10079 (_2!10285 lt!354623)))))))

(assert (=> d!75939 (or (not (= (bvand lt!354631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354630 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!354631 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!354631 lt!354630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!354652 () (_ BitVec 64))

(assert (=> d!75939 (= lt!354630 (bvmul lt!354652 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!75939 (or (= lt!354652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354652)))))

(assert (=> d!75939 (= lt!354652 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!75939 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!75939 (= lt!354631 (bitIndex!0 (size!4821 (buf!5365 (_2!10286 lt!354413))) (currentByte!10084 (_2!10286 lt!354413)) (currentBit!10079 (_2!10286 lt!354413))))))

(assert (=> d!75939 (= lt!354623 e!152374)))

(assert (=> d!75939 (= c!11116 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!75939 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4821 (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)))))))

(assert (=> d!75939 (= (readByteArrayLoop!0 (_2!10286 lt!354413) (array!10994 (store (arr!5766 arr!308) i!761 (_1!10286 lt!354413)) (size!4821 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!354623)))

(assert (= (and d!75939 c!11116) b!223816))

(assert (= (and d!75939 (not c!11116)) b!223817))

(assert (= (or b!223816 b!223817) bm!3564))

(assert (= (or b!223816 b!223817) bm!3563))

(assert (= (or b!223816 b!223817) bm!3562))

(assert (= (and d!75939 res!187895) b!223815))

(assert (= (and b!223815 res!187894) b!223813))

(assert (= (and d!75939 (not res!187896)) b!223814))

(declare-fun m!343071 () Bool)

(assert (=> d!75939 m!343071))

(assert (=> d!75939 m!343003))

(declare-fun m!343073 () Bool)

(assert (=> bm!3563 m!343073))

(declare-fun m!343075 () Bool)

(assert (=> b!223816 m!343075))

(declare-fun m!343077 () Bool)

(assert (=> b!223816 m!343077))

(declare-fun m!343079 () Bool)

(assert (=> b!223816 m!343079))

(declare-fun m!343081 () Bool)

(assert (=> b!223816 m!343081))

(declare-fun m!343083 () Bool)

(assert (=> b!223816 m!343083))

(declare-fun m!343085 () Bool)

(assert (=> b!223816 m!343085))

(declare-fun m!343087 () Bool)

(assert (=> b!223816 m!343087))

(declare-fun m!343089 () Bool)

(assert (=> b!223816 m!343089))

(declare-fun m!343091 () Bool)

(assert (=> b!223816 m!343091))

(declare-fun m!343093 () Bool)

(assert (=> b!223816 m!343093))

(declare-fun m!343095 () Bool)

(assert (=> b!223816 m!343095))

(declare-fun m!343097 () Bool)

(assert (=> b!223816 m!343097))

(declare-fun m!343099 () Bool)

(assert (=> b!223816 m!343099))

(declare-fun m!343101 () Bool)

(assert (=> b!223817 m!343101))

(declare-fun m!343103 () Bool)

(assert (=> b!223817 m!343103))

(declare-fun m!343105 () Bool)

(assert (=> b!223813 m!343105))

(declare-fun m!343107 () Bool)

(assert (=> b!223814 m!343107))

(declare-fun m!343109 () Bool)

(assert (=> b!223814 m!343109))

(declare-fun m!343111 () Bool)

(assert (=> bm!3564 m!343111))

(assert (=> bm!3562 m!343003))

(assert (=> b!223756 d!75939))

(declare-fun d!75970 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!75970 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354413)))) ((_ sign_extend 32) (currentByte!10084 (_2!10286 lt!354413))) ((_ sign_extend 32) (currentBit!10079 (_2!10286 lt!354413))) lt!354410) (bvsle ((_ sign_extend 32) lt!354410) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354413)))) ((_ sign_extend 32) (currentByte!10084 (_2!10286 lt!354413))) ((_ sign_extend 32) (currentBit!10079 (_2!10286 lt!354413)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18509 () Bool)

(assert (= bs!18509 d!75970))

(declare-fun m!343113 () Bool)

(assert (=> bs!18509 m!343113))

(assert (=> b!223756 d!75970))

(declare-fun d!75972 () Bool)

(declare-fun e!152378 () Bool)

(assert (=> d!75972 e!152378))

(declare-fun res!187902 () Bool)

(assert (=> d!75972 (=> (not res!187902) (not e!152378))))

(declare-fun lt!354673 () (_ BitVec 64))

(declare-fun lt!354674 () (_ BitVec 64))

(declare-fun lt!354675 () (_ BitVec 64))

(assert (=> d!75972 (= res!187902 (= lt!354674 (bvsub lt!354675 lt!354673)))))

(assert (=> d!75972 (or (= (bvand lt!354675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354675 lt!354673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75972 (= lt!354673 (remainingBits!0 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354413)))) ((_ sign_extend 32) (currentByte!10084 (_2!10286 lt!354413))) ((_ sign_extend 32) (currentBit!10079 (_2!10286 lt!354413)))))))

(declare-fun lt!354672 () (_ BitVec 64))

(declare-fun lt!354671 () (_ BitVec 64))

(assert (=> d!75972 (= lt!354675 (bvmul lt!354672 lt!354671))))

(assert (=> d!75972 (or (= lt!354672 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354671 (bvsdiv (bvmul lt!354672 lt!354671) lt!354672)))))

(assert (=> d!75972 (= lt!354671 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75972 (= lt!354672 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354413)))))))

(assert (=> d!75972 (= lt!354674 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10084 (_2!10286 lt!354413))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10079 (_2!10286 lt!354413)))))))

(assert (=> d!75972 (invariant!0 (currentBit!10079 (_2!10286 lt!354413)) (currentByte!10084 (_2!10286 lt!354413)) (size!4821 (buf!5365 (_2!10286 lt!354413))))))

(assert (=> d!75972 (= (bitIndex!0 (size!4821 (buf!5365 (_2!10286 lt!354413))) (currentByte!10084 (_2!10286 lt!354413)) (currentBit!10079 (_2!10286 lt!354413))) lt!354674)))

(declare-fun b!223822 () Bool)

(declare-fun res!187901 () Bool)

(assert (=> b!223822 (=> (not res!187901) (not e!152378))))

(assert (=> b!223822 (= res!187901 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354674))))

(declare-fun b!223823 () Bool)

(declare-fun lt!354670 () (_ BitVec 64))

(assert (=> b!223823 (= e!152378 (bvsle lt!354674 (bvmul lt!354670 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223823 (or (= lt!354670 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354670 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354670)))))

(assert (=> b!223823 (= lt!354670 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10286 lt!354413)))))))

(assert (= (and d!75972 res!187902) b!223822))

(assert (= (and b!223822 res!187901) b!223823))

(assert (=> d!75972 m!343113))

(declare-fun m!343115 () Bool)

(assert (=> d!75972 m!343115))

(assert (=> b!223756 d!75972))

(declare-fun d!75974 () Bool)

(declare-fun e!152379 () Bool)

(assert (=> d!75974 e!152379))

(declare-fun res!187904 () Bool)

(assert (=> d!75974 (=> (not res!187904) (not e!152379))))

(declare-fun lt!354679 () (_ BitVec 64))

(declare-fun lt!354680 () (_ BitVec 64))

(declare-fun lt!354681 () (_ BitVec 64))

(assert (=> d!75974 (= res!187904 (= lt!354680 (bvsub lt!354681 lt!354679)))))

(assert (=> d!75974 (or (= (bvand lt!354681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354679 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354681 lt!354679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75974 (= lt!354679 (remainingBits!0 ((_ sign_extend 32) (size!4821 (buf!5365 thiss!1870))) ((_ sign_extend 32) (currentByte!10084 thiss!1870)) ((_ sign_extend 32) (currentBit!10079 thiss!1870))))))

(declare-fun lt!354678 () (_ BitVec 64))

(declare-fun lt!354677 () (_ BitVec 64))

(assert (=> d!75974 (= lt!354681 (bvmul lt!354678 lt!354677))))

(assert (=> d!75974 (or (= lt!354678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354677 (bvsdiv (bvmul lt!354678 lt!354677) lt!354678)))))

(assert (=> d!75974 (= lt!354677 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75974 (= lt!354678 ((_ sign_extend 32) (size!4821 (buf!5365 thiss!1870))))))

(assert (=> d!75974 (= lt!354680 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10084 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10079 thiss!1870))))))

(assert (=> d!75974 (invariant!0 (currentBit!10079 thiss!1870) (currentByte!10084 thiss!1870) (size!4821 (buf!5365 thiss!1870)))))

(assert (=> d!75974 (= (bitIndex!0 (size!4821 (buf!5365 thiss!1870)) (currentByte!10084 thiss!1870) (currentBit!10079 thiss!1870)) lt!354680)))

(declare-fun b!223824 () Bool)

(declare-fun res!187903 () Bool)

(assert (=> b!223824 (=> (not res!187903) (not e!152379))))

(assert (=> b!223824 (= res!187903 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354680))))

(declare-fun b!223825 () Bool)

(declare-fun lt!354676 () (_ BitVec 64))

(assert (=> b!223825 (= e!152379 (bvsle lt!354680 (bvmul lt!354676 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223825 (or (= lt!354676 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354676 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354676)))))

(assert (=> b!223825 (= lt!354676 ((_ sign_extend 32) (size!4821 (buf!5365 thiss!1870))))))

(assert (= (and d!75974 res!187904) b!223824))

(assert (= (and b!223824 res!187903) b!223825))

(declare-fun m!343117 () Bool)

(assert (=> d!75974 m!343117))

(declare-fun m!343119 () Bool)

(assert (=> d!75974 m!343119))

(assert (=> b!223756 d!75974))

(declare-fun d!75976 () Bool)

(assert (=> d!75976 (= (invariant!0 (currentBit!10079 (_2!10285 lt!354409)) (currentByte!10084 (_2!10285 lt!354409)) (size!4821 (buf!5365 (_2!10285 lt!354409)))) (and (bvsge (currentBit!10079 (_2!10285 lt!354409)) #b00000000000000000000000000000000) (bvslt (currentBit!10079 (_2!10285 lt!354409)) #b00000000000000000000000000001000) (bvsge (currentByte!10084 (_2!10285 lt!354409)) #b00000000000000000000000000000000) (or (bvslt (currentByte!10084 (_2!10285 lt!354409)) (size!4821 (buf!5365 (_2!10285 lt!354409)))) (and (= (currentBit!10079 (_2!10285 lt!354409)) #b00000000000000000000000000000000) (= (currentByte!10084 (_2!10285 lt!354409)) (size!4821 (buf!5365 (_2!10285 lt!354409))))))))))

(assert (=> b!223756 d!75976))

(declare-fun d!75978 () Bool)

(assert (=> d!75978 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4821 (buf!5365 thiss!1870))) ((_ sign_extend 32) (currentByte!10084 thiss!1870)) ((_ sign_extend 32) (currentBit!10079 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4821 (buf!5365 thiss!1870))) ((_ sign_extend 32) (currentByte!10084 thiss!1870)) ((_ sign_extend 32) (currentBit!10079 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18510 () Bool)

(assert (= bs!18510 d!75978))

(assert (=> bs!18510 m!343117))

(assert (=> b!223758 d!75978))

(declare-fun d!75980 () Bool)

(assert (=> d!75980 (= (array_inv!4562 arr!308) (bvsge (size!4821 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!46632 d!75980))

(declare-fun d!75982 () Bool)

(assert (=> d!75982 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10079 thiss!1870) (currentByte!10084 thiss!1870) (size!4821 (buf!5365 thiss!1870))))))

(declare-fun bs!18511 () Bool)

(assert (= bs!18511 d!75982))

(assert (=> bs!18511 m!343119))

(assert (=> start!46632 d!75982))

(declare-fun d!75984 () Bool)

(declare-fun e!152380 () Bool)

(assert (=> d!75984 e!152380))

(declare-fun res!187906 () Bool)

(assert (=> d!75984 (=> (not res!187906) (not e!152380))))

(declare-fun lt!354686 () (_ BitVec 64))

(declare-fun lt!354687 () (_ BitVec 64))

(declare-fun lt!354685 () (_ BitVec 64))

(assert (=> d!75984 (= res!187906 (= lt!354686 (bvsub lt!354687 lt!354685)))))

(assert (=> d!75984 (or (= (bvand lt!354687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!354685 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!354687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!354687 lt!354685) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75984 (= lt!354685 (remainingBits!0 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10285 lt!354409)))) ((_ sign_extend 32) (currentByte!10084 (_2!10285 lt!354409))) ((_ sign_extend 32) (currentBit!10079 (_2!10285 lt!354409)))))))

(declare-fun lt!354684 () (_ BitVec 64))

(declare-fun lt!354683 () (_ BitVec 64))

(assert (=> d!75984 (= lt!354687 (bvmul lt!354684 lt!354683))))

(assert (=> d!75984 (or (= lt!354684 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!354683 (bvsdiv (bvmul lt!354684 lt!354683) lt!354684)))))

(assert (=> d!75984 (= lt!354683 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!75984 (= lt!354684 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10285 lt!354409)))))))

(assert (=> d!75984 (= lt!354686 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10084 (_2!10285 lt!354409))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10079 (_2!10285 lt!354409)))))))

(assert (=> d!75984 (invariant!0 (currentBit!10079 (_2!10285 lt!354409)) (currentByte!10084 (_2!10285 lt!354409)) (size!4821 (buf!5365 (_2!10285 lt!354409))))))

(assert (=> d!75984 (= (bitIndex!0 (size!4821 (buf!5365 (_2!10285 lt!354409))) (currentByte!10084 (_2!10285 lt!354409)) (currentBit!10079 (_2!10285 lt!354409))) lt!354686)))

(declare-fun b!223826 () Bool)

(declare-fun res!187905 () Bool)

(assert (=> b!223826 (=> (not res!187905) (not e!152380))))

(assert (=> b!223826 (= res!187905 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!354686))))

(declare-fun b!223827 () Bool)

(declare-fun lt!354682 () (_ BitVec 64))

(assert (=> b!223827 (= e!152380 (bvsle lt!354686 (bvmul lt!354682 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!223827 (or (= lt!354682 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!354682 #b0000000000000000000000000000000000000000000000000000000000001000) lt!354682)))))

(assert (=> b!223827 (= lt!354682 ((_ sign_extend 32) (size!4821 (buf!5365 (_2!10285 lt!354409)))))))

(assert (= (and d!75984 res!187906) b!223826))

(assert (= (and b!223826 res!187905) b!223827))

(declare-fun m!343121 () Bool)

(assert (=> d!75984 m!343121))

(assert (=> d!75984 m!343007))

(assert (=> b!223759 d!75984))

(declare-fun d!75986 () Bool)

(assert (=> d!75986 (= (array_inv!4562 (buf!5365 thiss!1870)) (bvsge (size!4821 (buf!5365 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!223757 d!75986))

(push 1)

(assert (not b!223817))

(assert (not b!223763))

(assert (not d!75972))

(assert (not b!223775))

(assert (not d!75931))

(assert (not d!75978))

(assert (not bm!3564))

(assert (not d!75926))

(assert (not b!223813))

(assert (not bm!3563))

(assert (not d!75939))

(assert (not d!75982))

(assert (not d!75970))

(assert (not d!75974))

(assert (not b!223816))

(assert (not bm!3562))

(assert (not d!75984))

(assert (not b!223814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

