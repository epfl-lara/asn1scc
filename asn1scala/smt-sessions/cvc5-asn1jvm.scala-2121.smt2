; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53712 () Bool)

(assert start!53712)

(declare-fun b!249785 () Bool)

(declare-fun e!173116 () Bool)

(declare-fun e!173110 () Bool)

(assert (=> b!249785 (= e!173116 e!173110)))

(declare-fun res!209064 () Bool)

(assert (=> b!249785 (=> (not res!209064) (not e!173110))))

(declare-datatypes ((array!13621 0))(
  ( (array!13622 (arr!6961 (Array (_ BitVec 32) (_ BitVec 8))) (size!5974 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10870 0))(
  ( (BitStream!10871 (buf!6467 array!13621) (currentByte!11898 (_ BitVec 32)) (currentBit!11893 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18084 0))(
  ( (Unit!18085) )
))
(declare-datatypes ((tuple2!21402 0))(
  ( (tuple2!21403 (_1!11626 Unit!18084) (_2!11626 BitStream!10870)) )
))
(declare-fun lt!388421 () tuple2!21402)

(declare-datatypes ((tuple2!21404 0))(
  ( (tuple2!21405 (_1!11627 BitStream!10870) (_2!11627 Bool)) )
))
(declare-fun lt!388418 () tuple2!21404)

(declare-fun bit!26 () Bool)

(assert (=> b!249785 (= res!209064 (and (= (_2!11627 lt!388418) bit!26) (= (_1!11627 lt!388418) (_2!11626 lt!388421))))))

(declare-fun thiss!1005 () BitStream!10870)

(declare-fun readBitPure!0 (BitStream!10870) tuple2!21404)

(declare-fun readerFrom!0 (BitStream!10870 (_ BitVec 32) (_ BitVec 32)) BitStream!10870)

(assert (=> b!249785 (= lt!388418 (readBitPure!0 (readerFrom!0 (_2!11626 lt!388421) (currentBit!11893 thiss!1005) (currentByte!11898 thiss!1005))))))

(declare-fun b!249786 () Bool)

(declare-fun e!173114 () Bool)

(assert (=> b!249786 (= e!173114 e!173116)))

(declare-fun res!209070 () Bool)

(assert (=> b!249786 (=> (not res!209070) (not e!173116))))

(declare-fun lt!388422 () (_ BitVec 64))

(declare-fun lt!388419 () (_ BitVec 64))

(assert (=> b!249786 (= res!209070 (= lt!388422 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388419)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249786 (= lt!388422 (bitIndex!0 (size!5974 (buf!6467 (_2!11626 lt!388421))) (currentByte!11898 (_2!11626 lt!388421)) (currentBit!11893 (_2!11626 lt!388421))))))

(assert (=> b!249786 (= lt!388419 (bitIndex!0 (size!5974 (buf!6467 thiss!1005)) (currentByte!11898 thiss!1005) (currentBit!11893 thiss!1005)))))

(declare-fun b!249788 () Bool)

(declare-fun e!173115 () Bool)

(declare-fun e!173113 () Bool)

(assert (=> b!249788 (= e!173115 e!173113)))

(declare-fun res!209067 () Bool)

(assert (=> b!249788 (=> res!209067 e!173113)))

(declare-fun lt!388420 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249788 (= res!209067 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!5974 (buf!6467 (_2!11626 lt!388421)))) ((_ sign_extend 32) (currentByte!11898 (_2!11626 lt!388421))) ((_ sign_extend 32) (currentBit!11893 (_2!11626 lt!388421))) lt!388420)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!249788 (= lt!388420 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!249789 () Bool)

(declare-fun res!209063 () Bool)

(declare-fun e!173117 () Bool)

(assert (=> b!249789 (=> (not res!209063) (not e!173117))))

(assert (=> b!249789 (= res!209063 (bvslt from!289 nBits!297))))

(declare-fun b!249790 () Bool)

(declare-fun res!209062 () Bool)

(assert (=> b!249790 (=> (not res!209062) (not e!173117))))

(assert (=> b!249790 (= res!209062 (validate_offset_bits!1 ((_ sign_extend 32) (size!5974 (buf!6467 thiss!1005))) ((_ sign_extend 32) (currentByte!11898 thiss!1005)) ((_ sign_extend 32) (currentBit!11893 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249791 () Bool)

(assert (=> b!249791 (= e!173117 (not e!173115))))

(declare-fun res!209069 () Bool)

(assert (=> b!249791 (=> res!209069 e!173115)))

(assert (=> b!249791 (= res!209069 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249791 (validate_offset_bits!1 ((_ sign_extend 32) (size!5974 (buf!6467 (_2!11626 lt!388421)))) ((_ sign_extend 32) (currentByte!11898 (_2!11626 lt!388421))) ((_ sign_extend 32) (currentBit!11893 (_2!11626 lt!388421))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388417 () Unit!18084)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10870 BitStream!10870 (_ BitVec 64) (_ BitVec 64)) Unit!18084)

(assert (=> b!249791 (= lt!388417 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11626 lt!388421) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249791 e!173114))

(declare-fun res!209066 () Bool)

(assert (=> b!249791 (=> (not res!209066) (not e!173114))))

(assert (=> b!249791 (= res!209066 (= (size!5974 (buf!6467 thiss!1005)) (size!5974 (buf!6467 (_2!11626 lt!388421)))))))

(declare-fun appendBit!0 (BitStream!10870 Bool) tuple2!21402)

(assert (=> b!249791 (= lt!388421 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249792 () Bool)

(assert (=> b!249792 (= e!173110 (= (bitIndex!0 (size!5974 (buf!6467 (_1!11627 lt!388418))) (currentByte!11898 (_1!11627 lt!388418)) (currentBit!11893 (_1!11627 lt!388418))) lt!388422))))

(declare-fun b!249793 () Bool)

(assert (=> b!249793 (= e!173113 (bvslt lt!388420 (bvsub nBits!297 from!289)))))

(declare-fun b!249794 () Bool)

(declare-fun res!209065 () Bool)

(assert (=> b!249794 (=> (not res!209065) (not e!173116))))

(declare-fun isPrefixOf!0 (BitStream!10870 BitStream!10870) Bool)

(assert (=> b!249794 (= res!209065 (isPrefixOf!0 thiss!1005 (_2!11626 lt!388421)))))

(declare-fun res!209068 () Bool)

(assert (=> start!53712 (=> (not res!209068) (not e!173117))))

(assert (=> start!53712 (= res!209068 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53712 e!173117))

(assert (=> start!53712 true))

(declare-fun e!173112 () Bool)

(declare-fun inv!12 (BitStream!10870) Bool)

(assert (=> start!53712 (and (inv!12 thiss!1005) e!173112)))

(declare-fun b!249787 () Bool)

(declare-fun array_inv!5715 (array!13621) Bool)

(assert (=> b!249787 (= e!173112 (array_inv!5715 (buf!6467 thiss!1005)))))

(assert (= (and start!53712 res!209068) b!249790))

(assert (= (and b!249790 res!209062) b!249789))

(assert (= (and b!249789 res!209063) b!249791))

(assert (= (and b!249791 res!209066) b!249786))

(assert (= (and b!249786 res!209070) b!249794))

(assert (= (and b!249794 res!209065) b!249785))

(assert (= (and b!249785 res!209064) b!249792))

(assert (= (and b!249791 (not res!209069)) b!249788))

(assert (= (and b!249788 (not res!209067)) b!249793))

(assert (= start!53712 b!249787))

(declare-fun m!376179 () Bool)

(assert (=> b!249791 m!376179))

(declare-fun m!376181 () Bool)

(assert (=> b!249791 m!376181))

(declare-fun m!376183 () Bool)

(assert (=> b!249791 m!376183))

(declare-fun m!376185 () Bool)

(assert (=> b!249787 m!376185))

(declare-fun m!376187 () Bool)

(assert (=> b!249786 m!376187))

(declare-fun m!376189 () Bool)

(assert (=> b!249786 m!376189))

(declare-fun m!376191 () Bool)

(assert (=> b!249785 m!376191))

(assert (=> b!249785 m!376191))

(declare-fun m!376193 () Bool)

(assert (=> b!249785 m!376193))

(declare-fun m!376195 () Bool)

(assert (=> b!249794 m!376195))

(declare-fun m!376197 () Bool)

(assert (=> b!249792 m!376197))

(declare-fun m!376199 () Bool)

(assert (=> b!249790 m!376199))

(declare-fun m!376201 () Bool)

(assert (=> start!53712 m!376201))

(declare-fun m!376203 () Bool)

(assert (=> b!249788 m!376203))

(push 1)

(assert (not b!249790))

(assert (not b!249792))

(assert (not b!249785))

(assert (not b!249786))

(assert (not b!249788))

(assert (not b!249794))

(assert (not b!249791))

(assert (not b!249787))

(assert (not start!53712))

(check-sat)

(pop 1)

(push 1)

(check-sat)

