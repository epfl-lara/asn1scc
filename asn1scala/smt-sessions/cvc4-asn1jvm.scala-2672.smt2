; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65456 () Bool)

(assert start!65456)

(declare-fun b!293566 () Bool)

(declare-fun res!242416 () Bool)

(declare-fun e!209713 () Bool)

(assert (=> b!293566 (=> (not res!242416) (not e!209713))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293566 (= res!242416 (bvslt from!505 to!474))))

(declare-fun res!242415 () Bool)

(assert (=> start!65456 (=> (not res!242415) (not e!209713))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((array!17556 0))(
  ( (array!17557 (arr!8634 (Array (_ BitVec 32) (_ BitVec 8))) (size!7608 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17556)

(assert (=> start!65456 (= res!242415 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7608 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65456 e!209713))

(declare-datatypes ((BitStream!13220 0))(
  ( (BitStream!13221 (buf!7671 array!17556) (currentByte!14144 (_ BitVec 32)) (currentBit!14139 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13220)

(declare-fun e!209715 () Bool)

(declare-fun inv!12 (BitStream!13220) Bool)

(assert (=> start!65456 (and (inv!12 thiss!1728) e!209715)))

(assert (=> start!65456 true))

(declare-fun array_inv!7220 (array!17556) Bool)

(assert (=> start!65456 (array_inv!7220 arr!273)))

(declare-fun b!293565 () Bool)

(declare-fun res!242417 () Bool)

(assert (=> b!293565 (=> (not res!242417) (not e!209713))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293565 (= res!242417 (validate_offset_bits!1 ((_ sign_extend 32) (size!7608 (buf!7671 thiss!1728))) ((_ sign_extend 32) (currentByte!14144 thiss!1728)) ((_ sign_extend 32) (currentBit!14139 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293568 () Bool)

(assert (=> b!293568 (= e!209715 (array_inv!7220 (buf!7671 thiss!1728)))))

(declare-fun b!293567 () Bool)

(assert (=> b!293567 (= e!209713 (not (or (not (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23054 0))(
  ( (tuple2!23055 (_1!12832 Bool) (_2!12832 BitStream!13220)) )
))
(declare-fun lt!425516 () tuple2!23054)

(assert (=> b!293567 (validate_offset_bits!1 ((_ sign_extend 32) (size!7608 (buf!7671 (_2!12832 lt!425516)))) ((_ sign_extend 32) (currentByte!14144 (_2!12832 lt!425516))) ((_ sign_extend 32) (currentBit!14139 (_2!12832 lt!425516))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20405 0))(
  ( (Unit!20406) )
))
(declare-fun lt!425517 () Unit!20405)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13220 BitStream!13220 (_ BitVec 64) (_ BitVec 64)) Unit!20405)

(assert (=> b!293567 (= lt!425517 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12832 lt!425516) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!13220) tuple2!23054)

(assert (=> b!293567 (= lt!425516 (readBit!0 thiss!1728))))

(assert (= (and start!65456 res!242415) b!293565))

(assert (= (and b!293565 res!242417) b!293566))

(assert (= (and b!293566 res!242416) b!293567))

(assert (= start!65456 b!293568))

(declare-fun m!429113 () Bool)

(assert (=> start!65456 m!429113))

(declare-fun m!429115 () Bool)

(assert (=> start!65456 m!429115))

(declare-fun m!429117 () Bool)

(assert (=> b!293565 m!429117))

(declare-fun m!429119 () Bool)

(assert (=> b!293568 m!429119))

(declare-fun m!429121 () Bool)

(assert (=> b!293567 m!429121))

(declare-fun m!429123 () Bool)

(assert (=> b!293567 m!429123))

(declare-fun m!429125 () Bool)

(assert (=> b!293567 m!429125))

(push 1)

(assert (not b!293565))

(assert (not b!293567))

(assert (not start!65456))

(assert (not b!293568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

