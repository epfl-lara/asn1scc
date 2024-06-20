; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47258 () Bool)

(assert start!47258)

(declare-fun b!225647 () Bool)

(declare-fun res!189345 () Bool)

(declare-fun e!154089 () Bool)

(assert (=> b!225647 (=> (not res!189345) (not e!154089))))

(declare-datatypes ((array!11240 0))(
  ( (array!11241 (arr!5890 (Array (_ BitVec 32) (_ BitVec 8))) (size!4933 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8962 0))(
  ( (BitStream!8963 (buf!5474 array!11240) (currentByte!10258 (_ BitVec 32)) (currentBit!10253 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8962)

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225647 (= res!189345 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4933 (buf!5474 thiss!1870))) ((_ sign_extend 32) (currentByte!10258 thiss!1870)) ((_ sign_extend 32) (currentBit!10253 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225649 () Bool)

(declare-datatypes ((tuple2!19298 0))(
  ( (tuple2!19299 (_1!10436 (_ BitVec 8)) (_2!10436 BitStream!8962)) )
))
(declare-fun readByte!0 (BitStream!8962) tuple2!19298)

(assert (=> b!225649 (= e!154089 (not (= (size!4933 (buf!5474 thiss!1870)) (size!4933 (buf!5474 (_2!10436 (readByte!0 thiss!1870)))))))))

(declare-fun b!225650 () Bool)

(declare-fun e!154091 () Bool)

(declare-fun array_inv!4674 (array!11240) Bool)

(assert (=> b!225650 (= e!154091 (array_inv!4674 (buf!5474 thiss!1870)))))

(declare-fun res!189343 () Bool)

(assert (=> start!47258 (=> (not res!189343) (not e!154089))))

(declare-fun arr!308 () array!11240)

(assert (=> start!47258 (= res!189343 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4933 arr!308))))))

(assert (=> start!47258 e!154089))

(assert (=> start!47258 true))

(assert (=> start!47258 (array_inv!4674 arr!308)))

(declare-fun inv!12 (BitStream!8962) Bool)

(assert (=> start!47258 (and (inv!12 thiss!1870) e!154091)))

(declare-fun b!225648 () Bool)

(declare-fun res!189344 () Bool)

(assert (=> b!225648 (=> (not res!189344) (not e!154089))))

(assert (=> b!225648 (= res!189344 (bvslt i!761 to!496))))

(assert (= (and start!47258 res!189343) b!225647))

(assert (= (and b!225647 res!189345) b!225648))

(assert (= (and b!225648 res!189344) b!225649))

(assert (= start!47258 b!225650))

(declare-fun m!346677 () Bool)

(assert (=> b!225647 m!346677))

(declare-fun m!346679 () Bool)

(assert (=> b!225649 m!346679))

(declare-fun m!346681 () Bool)

(assert (=> b!225650 m!346681))

(declare-fun m!346683 () Bool)

(assert (=> start!47258 m!346683))

(declare-fun m!346685 () Bool)

(assert (=> start!47258 m!346685))

(push 1)

(assert (not start!47258))

(assert (not b!225649))

(assert (not b!225647))

(assert (not b!225650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76564 () Bool)

(assert (=> d!76564 (= (array_inv!4674 arr!308) (bvsge (size!4933 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47258 d!76564))

(declare-fun d!76566 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!76566 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10253 thiss!1870) (currentByte!10258 thiss!1870) (size!4933 (buf!5474 thiss!1870))))))

(declare-fun bs!18713 () Bool)

(assert (= bs!18713 d!76566))

(declare-fun m!346707 () Bool)

(assert (=> bs!18713 m!346707))

(assert (=> start!47258 d!76566))

(declare-fun d!76570 () Bool)

(declare-fun lt!358742 () (_ BitVec 8))

(declare-fun lt!358736 () (_ BitVec 8))

(assert (=> d!76570 (= lt!358742 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5890 (buf!5474 thiss!1870)) (currentByte!10258 thiss!1870))) ((_ sign_extend 24) lt!358736))))))

(assert (=> d!76570 (= lt!358736 ((_ extract 7 0) (currentBit!10253 thiss!1870)))))

(declare-fun e!154125 () Bool)

(assert (=> d!76570 e!154125))

(declare-fun res!189375 () Bool)

(assert (=> d!76570 (=> (not res!189375) (not e!154125))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!76570 (= res!189375 (validate_offset_bits!1 ((_ sign_extend 32) (size!4933 (buf!5474 thiss!1870))) ((_ sign_extend 32) (currentByte!10258 thiss!1870)) ((_ sign_extend 32) (currentBit!10253 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((Unit!16587 0))(
  ( (Unit!16588) )
))
(declare-datatypes ((tuple2!19306 0))(
  ( (tuple2!19307 (_1!10440 Unit!16587) (_2!10440 (_ BitVec 8))) )
))
(declare-fun Unit!16592 () Unit!16587)

(declare-fun Unit!16594 () Unit!16587)

(assert (=> d!76570 (= (readByte!0 thiss!1870) (tuple2!19299 (_2!10440 (ite (bvsgt ((_ sign_extend 24) lt!358736) #b00000000000000000000000000000000) (tuple2!19307 Unit!16592 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358742) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5890 (buf!5474 thiss!1870)) (bvadd (currentByte!10258 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358736)))))))) (tuple2!19307 Unit!16594 lt!358742))) (BitStream!8963 (buf!5474 thiss!1870) (bvadd (currentByte!10258 thiss!1870) #b00000000000000000000000000000001) (currentBit!10253 thiss!1870))))))

(declare-fun b!225683 () Bool)

(declare-fun e!154124 () Bool)

(assert (=> b!225683 (= e!154125 e!154124)))

(declare-fun res!189376 () Bool)

(assert (=> b!225683 (=> (not res!189376) (not e!154124))))

(declare-fun lt!358739 () tuple2!19298)

(assert (=> b!225683 (= res!189376 (= (buf!5474 (_2!10436 lt!358739)) (buf!5474 thiss!1870)))))

(declare-fun lt!358737 () (_ BitVec 8))

(declare-fun lt!358738 () (_ BitVec 8))

(declare-fun Unit!16597 () Unit!16587)

(declare-fun Unit!16598 () Unit!16587)

(assert (=> b!225683 (= lt!358739 (tuple2!19299 (_2!10440 (ite (bvsgt ((_ sign_extend 24) lt!358737) #b00000000000000000000000000000000) (tuple2!19307 Unit!16597 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!358738) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5890 (buf!5474 thiss!1870)) (bvadd (currentByte!10258 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!358737)))))))) (tuple2!19307 Unit!16598 lt!358738))) (BitStream!8963 (buf!5474 thiss!1870) (bvadd (currentByte!10258 thiss!1870) #b00000000000000000000000000000001) (currentBit!10253 thiss!1870))))))

(assert (=> b!225683 (= lt!358738 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5890 (buf!5474 thiss!1870)) (currentByte!10258 thiss!1870))) ((_ sign_extend 24) lt!358737))))))

(assert (=> b!225683 (= lt!358737 ((_ extract 7 0) (currentBit!10253 thiss!1870)))))

(declare-fun lt!358741 () (_ BitVec 64))

(declare-fun lt!358740 () (_ BitVec 64))

(declare-fun b!225684 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!225684 (= e!154124 (= (bitIndex!0 (size!4933 (buf!5474 (_2!10436 lt!358739))) (currentByte!10258 (_2!10436 lt!358739)) (currentBit!10253 (_2!10436 lt!358739))) (bvadd lt!358740 lt!358741)))))

(assert (=> b!225684 (or (not (= (bvand lt!358740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!358741 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!358740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!358740 lt!358741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!225684 (= lt!358741 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!225684 (= lt!358740 (bitIndex!0 (size!4933 (buf!5474 thiss!1870)) (currentByte!10258 thiss!1870) (currentBit!10253 thiss!1870)))))

(assert (= (and d!76570 res!189375) b!225683))

(assert (= (and b!225683 res!189376) b!225684))

(declare-fun m!346709 () Bool)

(assert (=> d!76570 m!346709))

(declare-fun m!346713 () Bool)

(assert (=> d!76570 m!346713))

(declare-fun m!346717 () Bool)

(assert (=> d!76570 m!346717))

(assert (=> b!225683 m!346717))

(assert (=> b!225683 m!346709))

(declare-fun m!346721 () Bool)

(assert (=> b!225684 m!346721))

(declare-fun m!346725 () Bool)

(assert (=> b!225684 m!346725))

(assert (=> b!225649 d!76570))

(declare-fun d!76574 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!76574 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4933 (buf!5474 thiss!1870))) ((_ sign_extend 32) (currentByte!10258 thiss!1870)) ((_ sign_extend 32) (currentBit!10253 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4933 (buf!5474 thiss!1870))) ((_ sign_extend 32) (currentByte!10258 thiss!1870)) ((_ sign_extend 32) (currentBit!10253 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18714 () Bool)

(assert (= bs!18714 d!76574))

(declare-fun m!346729 () Bool)

(assert (=> bs!18714 m!346729))

(assert (=> b!225647 d!76574))

(declare-fun d!76580 () Bool)

(assert (=> d!76580 (= (array_inv!4674 (buf!5474 thiss!1870)) (bvsge (size!4933 (buf!5474 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!225650 d!76580))

(push 1)

(assert (not d!76574))

(assert (not d!76566))

(assert (not d!76570))

(assert (not b!225684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

