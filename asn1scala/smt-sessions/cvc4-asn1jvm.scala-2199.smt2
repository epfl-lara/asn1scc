; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55748 () Bool)

(assert start!55748)

(declare-fun expected!109 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14164 0))(
  ( (array!14165 (arr!7191 (Array (_ BitVec 32) (_ BitVec 8))) (size!6204 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11330 0))(
  ( (BitStream!11331 (buf!6726 array!14164) (currentByte!12361 (_ BitVec 32)) (currentBit!12356 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11330)

(declare-fun e!179842 () Bool)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun b!259236 () Bool)

(declare-datatypes ((tuple2!22200 0))(
  ( (tuple2!22201 (_1!12036 Bool) (_2!12036 BitStream!11330)) )
))
(declare-fun lt!400997 () tuple2!22200)

(assert (=> b!259236 (= e!179842 (and (= (_1!12036 lt!400997) expected!109) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)) (not (= (size!6204 (buf!6726 thiss!1754)) (size!6204 (buf!6726 (_2!12036 lt!400997)))))))))

(declare-fun readBit!0 (BitStream!11330) tuple2!22200)

(assert (=> b!259236 (= lt!400997 (readBit!0 thiss!1754))))

(declare-fun b!259235 () Bool)

(declare-fun res!217158 () Bool)

(assert (=> b!259235 (=> (not res!217158) (not e!179842))))

(assert (=> b!259235 (= res!217158 (not (= from!526 nBits!535)))))

(declare-fun b!259234 () Bool)

(declare-fun res!217157 () Bool)

(assert (=> b!259234 (=> (not res!217157) (not e!179842))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!259234 (= res!217157 (validate_offset_bits!1 ((_ sign_extend 32) (size!6204 (buf!6726 thiss!1754))) ((_ sign_extend 32) (currentByte!12361 thiss!1754)) ((_ sign_extend 32) (currentBit!12356 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!217159 () Bool)

(assert (=> start!55748 (=> (not res!217159) (not e!179842))))

(assert (=> start!55748 (= res!217159 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55748 e!179842))

(assert (=> start!55748 true))

(declare-fun e!179840 () Bool)

(declare-fun inv!12 (BitStream!11330) Bool)

(assert (=> start!55748 (and (inv!12 thiss!1754) e!179840)))

(declare-fun b!259237 () Bool)

(declare-fun array_inv!5945 (array!14164) Bool)

(assert (=> b!259237 (= e!179840 (array_inv!5945 (buf!6726 thiss!1754)))))

(assert (= (and start!55748 res!217159) b!259234))

(assert (= (and b!259234 res!217157) b!259235))

(assert (= (and b!259235 res!217158) b!259236))

(assert (= start!55748 b!259237))

(declare-fun m!388533 () Bool)

(assert (=> b!259236 m!388533))

(declare-fun m!388535 () Bool)

(assert (=> b!259234 m!388535))

(declare-fun m!388537 () Bool)

(assert (=> start!55748 m!388537))

(declare-fun m!388539 () Bool)

(assert (=> b!259237 m!388539))

(push 1)

(assert (not b!259234))

(assert (not b!259237))

(assert (not start!55748))

(assert (not b!259236))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86976 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86976 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6204 (buf!6726 thiss!1754))) ((_ sign_extend 32) (currentByte!12361 thiss!1754)) ((_ sign_extend 32) (currentBit!12356 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6204 (buf!6726 thiss!1754))) ((_ sign_extend 32) (currentByte!12361 thiss!1754)) ((_ sign_extend 32) (currentBit!12356 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!22027 () Bool)

(assert (= bs!22027 d!86976))

(declare-fun m!388543 () Bool)

(assert (=> bs!22027 m!388543))

(assert (=> b!259234 d!86976))

(declare-fun d!86978 () Bool)

(assert (=> d!86978 (= (array_inv!5945 (buf!6726 thiss!1754)) (bvsge (size!6204 (buf!6726 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!259237 d!86978))

(declare-fun d!86980 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86980 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12356 thiss!1754) (currentByte!12361 thiss!1754) (size!6204 (buf!6726 thiss!1754))))))

(declare-fun bs!22028 () Bool)

(assert (= bs!22028 d!86980))

(declare-fun m!388545 () Bool)

(assert (=> bs!22028 m!388545))

(assert (=> start!55748 d!86980))

(declare-fun d!86982 () Bool)

(declare-fun e!179863 () Bool)

(assert (=> d!86982 e!179863))

(declare-fun res!217168 () Bool)

(assert (=> d!86982 (=> (not res!217168) (not e!179863))))

(declare-datatypes ((Unit!18457 0))(
  ( (Unit!18458) )
))
(declare-datatypes ((tuple2!22206 0))(
  ( (tuple2!22207 (_1!12039 Unit!18457) (_2!12039 BitStream!11330)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11330) tuple2!22206)

(assert (=> d!86982 (= res!217168 (= (buf!6726 (_2!12039 (increaseBitIndex!0 thiss!1754))) (buf!6726 thiss!1754)))))

(declare-fun lt!401058 () Bool)

(assert (=> d!86982 (= lt!401058 (not (= (bvand ((_ sign_extend 24) (select (arr!7191 (buf!6726 thiss!1754)) (currentByte!12361 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12356 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!401056 () tuple2!22200)

(assert (=> d!86982 (= lt!401056 (tuple2!22201 (not (= (bvand ((_ sign_extend 24) (select (arr!7191 (buf!6726 thiss!1754)) (currentByte!12361 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12356 thiss!1754)))) #b00000000000000000000000000000000)) (_2!12039 (increaseBitIndex!0 thiss!1754))))))

