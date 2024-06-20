; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27460 () Bool)

(assert start!27460)

(declare-fun b!141207 () Bool)

(declare-fun res!117768 () Bool)

(declare-fun e!94077 () Bool)

(assert (=> b!141207 (=> (not res!117768) (not e!94077))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!141207 (= res!117768 (bvslt from!447 to!404))))

(declare-fun b!141208 () Bool)

(declare-fun e!94076 () Bool)

(declare-fun e!94074 () Bool)

(assert (=> b!141208 (= e!94076 e!94074)))

(declare-fun res!117764 () Bool)

(assert (=> b!141208 (=> res!117764 e!94074)))

(declare-datatypes ((array!6475 0))(
  ( (array!6476 (arr!3638 (Array (_ BitVec 32) (_ BitVec 8))) (size!2931 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5120 0))(
  ( (BitStream!5121 (buf!3352 array!6475) (currentByte!6212 (_ BitVec 32)) (currentBit!6207 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8844 0))(
  ( (Unit!8845) )
))
(declare-datatypes ((tuple2!12466 0))(
  ( (tuple2!12467 (_1!6563 Unit!8844) (_2!6563 BitStream!5120)) )
))
(declare-fun lt!219337 () tuple2!12466)

(declare-fun lt!219335 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141208 (= res!117764 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2931 (buf!3352 (_2!6563 lt!219337)))) ((_ sign_extend 32) (currentByte!6212 (_2!6563 lt!219337))) ((_ sign_extend 32) (currentBit!6207 (_2!6563 lt!219337))) lt!219335)))))

(assert (=> b!141208 (= lt!219335 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!141209 () Bool)

(assert (=> b!141209 (= e!94077 (not e!94076))))

(declare-fun res!117767 () Bool)

(assert (=> b!141209 (=> res!117767 e!94076)))

(assert (=> b!141209 (= res!117767 (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(assert (=> b!141209 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2931 (buf!3352 (_2!6563 lt!219337)))) ((_ sign_extend 32) (currentByte!6212 (_2!6563 lt!219337))) ((_ sign_extend 32) (currentBit!6207 (_2!6563 lt!219337))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219334 () Unit!8844)

(declare-fun thiss!1634 () BitStream!5120)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5120 BitStream!5120 (_ BitVec 64) (_ BitVec 32)) Unit!8844)

(assert (=> b!141209 (= lt!219334 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6563 lt!219337) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94075 () Bool)

(assert (=> b!141209 e!94075))

(declare-fun res!117771 () Bool)

(assert (=> b!141209 (=> (not res!117771) (not e!94075))))

(assert (=> b!141209 (= res!117771 (= (size!2931 (buf!3352 thiss!1634)) (size!2931 (buf!3352 (_2!6563 lt!219337)))))))

(declare-fun arr!237 () array!6475)

(declare-fun appendByte!0 (BitStream!5120 (_ BitVec 8)) tuple2!12466)

(assert (=> b!141209 (= lt!219337 (appendByte!0 thiss!1634 (select (arr!3638 arr!237) from!447)))))

(declare-fun b!141210 () Bool)

(declare-fun res!117772 () Bool)

(assert (=> b!141210 (=> (not res!117772) (not e!94077))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141210 (= res!117772 (invariant!0 (currentBit!6207 thiss!1634) (currentByte!6212 thiss!1634) (size!2931 (buf!3352 thiss!1634))))))

(declare-fun b!141211 () Bool)

(declare-fun res!117769 () Bool)

(assert (=> b!141211 (=> (not res!117769) (not e!94077))))

(assert (=> b!141211 (= res!117769 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2931 (buf!3352 thiss!1634))) ((_ sign_extend 32) (currentByte!6212 thiss!1634)) ((_ sign_extend 32) (currentBit!6207 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141206 () Bool)

(declare-fun res!117766 () Bool)

(assert (=> b!141206 (=> (not res!117766) (not e!94075))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141206 (= res!117766 (= (bitIndex!0 (size!2931 (buf!3352 (_2!6563 lt!219337))) (currentByte!6212 (_2!6563 lt!219337)) (currentBit!6207 (_2!6563 lt!219337))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2931 (buf!3352 thiss!1634)) (currentByte!6212 thiss!1634) (currentBit!6207 thiss!1634)))))))

(declare-fun res!117765 () Bool)

(assert (=> start!27460 (=> (not res!117765) (not e!94077))))

(assert (=> start!27460 (= res!117765 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2931 arr!237))))))

(assert (=> start!27460 e!94077))

(assert (=> start!27460 true))

(declare-fun array_inv!2720 (array!6475) Bool)

(assert (=> start!27460 (array_inv!2720 arr!237)))

(declare-fun e!94072 () Bool)

(declare-fun inv!12 (BitStream!5120) Bool)

(assert (=> start!27460 (and (inv!12 thiss!1634) e!94072)))

(declare-fun b!141212 () Bool)

(assert (=> b!141212 (= e!94072 (array_inv!2720 (buf!3352 thiss!1634)))))

(declare-fun b!141213 () Bool)

(declare-datatypes ((tuple2!12468 0))(
  ( (tuple2!12469 (_1!6564 BitStream!5120) (_2!6564 BitStream!5120)) )
))
(declare-fun lt!219338 () tuple2!12468)

(declare-datatypes ((tuple2!12470 0))(
  ( (tuple2!12471 (_1!6565 BitStream!5120) (_2!6565 (_ BitVec 8))) )
))
(declare-fun lt!219336 () tuple2!12470)

(assert (=> b!141213 (= e!94075 (and (= (_2!6565 lt!219336) (select (arr!3638 arr!237) from!447)) (= (_1!6565 lt!219336) (_2!6564 lt!219338))))))

(declare-fun readBytePure!0 (BitStream!5120) tuple2!12470)

(assert (=> b!141213 (= lt!219336 (readBytePure!0 (_1!6564 lt!219338)))))

(declare-fun reader!0 (BitStream!5120 BitStream!5120) tuple2!12468)

(assert (=> b!141213 (= lt!219338 (reader!0 thiss!1634 (_2!6563 lt!219337)))))

(declare-fun b!141214 () Bool)

(declare-fun res!117770 () Bool)

(assert (=> b!141214 (=> (not res!117770) (not e!94075))))

(declare-fun isPrefixOf!0 (BitStream!5120 BitStream!5120) Bool)

(assert (=> b!141214 (= res!117770 (isPrefixOf!0 thiss!1634 (_2!6563 lt!219337)))))

(declare-fun b!141215 () Bool)

(assert (=> b!141215 (= e!94074 (bvslt lt!219335 (bvsub to!404 from!447)))))

(assert (= (and start!27460 res!117765) b!141211))

(assert (= (and b!141211 res!117769) b!141207))

(assert (= (and b!141207 res!117768) b!141210))

(assert (= (and b!141210 res!117772) b!141209))

(assert (= (and b!141209 res!117771) b!141206))

(assert (= (and b!141206 res!117766) b!141214))

(assert (= (and b!141214 res!117770) b!141213))

(assert (= (and b!141209 (not res!117767)) b!141208))

(assert (= (and b!141208 (not res!117764)) b!141215))

(assert (= start!27460 b!141212))

(declare-fun m!217043 () Bool)

(assert (=> start!27460 m!217043))

(declare-fun m!217045 () Bool)

(assert (=> start!27460 m!217045))

(declare-fun m!217047 () Bool)

(assert (=> b!141209 m!217047))

(declare-fun m!217049 () Bool)

(assert (=> b!141209 m!217049))

(declare-fun m!217051 () Bool)

(assert (=> b!141209 m!217051))

(assert (=> b!141209 m!217051))

(declare-fun m!217053 () Bool)

(assert (=> b!141209 m!217053))

(declare-fun m!217055 () Bool)

(assert (=> b!141206 m!217055))

(declare-fun m!217057 () Bool)

(assert (=> b!141206 m!217057))

(declare-fun m!217059 () Bool)

(assert (=> b!141210 m!217059))

(declare-fun m!217061 () Bool)

(assert (=> b!141214 m!217061))

(declare-fun m!217063 () Bool)

(assert (=> b!141208 m!217063))

(declare-fun m!217065 () Bool)

(assert (=> b!141212 m!217065))

(declare-fun m!217067 () Bool)

(assert (=> b!141211 m!217067))

(assert (=> b!141213 m!217051))

(declare-fun m!217069 () Bool)

(assert (=> b!141213 m!217069))

(declare-fun m!217071 () Bool)

(assert (=> b!141213 m!217071))

(push 1)

(assert (not b!141211))

(assert (not b!141213))

(assert (not b!141210))

(assert (not b!141214))

(assert (not start!27460))

(assert (not b!141206))

(assert (not b!141209))

(assert (not b!141212))

(assert (not b!141208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

