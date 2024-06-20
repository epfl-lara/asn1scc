; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27438 () Bool)

(assert start!27438)

(declare-fun b!140917 () Bool)

(declare-fun res!117511 () Bool)

(declare-fun e!93883 () Bool)

(assert (=> b!140917 (=> (not res!117511) (not e!93883))))

(declare-datatypes ((array!6453 0))(
  ( (array!6454 (arr!3627 (Array (_ BitVec 32) (_ BitVec 8))) (size!2920 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5098 0))(
  ( (BitStream!5099 (buf!3341 array!6453) (currentByte!6201 (_ BitVec 32)) (currentBit!6196 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5098)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140917 (= res!117511 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2920 (buf!3341 thiss!1634))) ((_ sign_extend 32) (currentByte!6201 thiss!1634)) ((_ sign_extend 32) (currentBit!6196 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!117512 () Bool)

(assert (=> start!27438 (=> (not res!117512) (not e!93883))))

(declare-fun arr!237 () array!6453)

(assert (=> start!27438 (= res!117512 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2920 arr!237))))))

(assert (=> start!27438 e!93883))

(assert (=> start!27438 true))

(declare-fun array_inv!2709 (array!6453) Bool)

(assert (=> start!27438 (array_inv!2709 arr!237)))

(declare-fun e!93885 () Bool)

(declare-fun inv!12 (BitStream!5098) Bool)

(assert (=> start!27438 (and (inv!12 thiss!1634) e!93885)))

(declare-fun b!140918 () Bool)

(assert (=> b!140918 (= e!93885 (array_inv!2709 (buf!3341 thiss!1634)))))

(declare-fun b!140919 () Bool)

(declare-fun res!117509 () Bool)

(assert (=> b!140919 (=> (not res!117509) (not e!93883))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140919 (= res!117509 (invariant!0 (currentBit!6196 thiss!1634) (currentByte!6201 thiss!1634) (size!2920 (buf!3341 thiss!1634))))))

(declare-fun b!140920 () Bool)

(declare-fun res!117508 () Bool)

(declare-fun e!93881 () Bool)

(assert (=> b!140920 (=> (not res!117508) (not e!93881))))

(declare-datatypes ((Unit!8822 0))(
  ( (Unit!8823) )
))
(declare-datatypes ((tuple2!12400 0))(
  ( (tuple2!12401 (_1!6530 Unit!8822) (_2!6530 BitStream!5098)) )
))
(declare-fun lt!219197 () tuple2!12400)

(declare-fun isPrefixOf!0 (BitStream!5098 BitStream!5098) Bool)

(assert (=> b!140920 (= res!117508 (isPrefixOf!0 thiss!1634 (_2!6530 lt!219197)))))

(declare-fun b!140921 () Bool)

(declare-fun res!117514 () Bool)

(assert (=> b!140921 (=> (not res!117514) (not e!93881))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140921 (= res!117514 (= (bitIndex!0 (size!2920 (buf!3341 (_2!6530 lt!219197))) (currentByte!6201 (_2!6530 lt!219197)) (currentBit!6196 (_2!6530 lt!219197))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2920 (buf!3341 thiss!1634)) (currentByte!6201 thiss!1634) (currentBit!6196 thiss!1634)))))))

(declare-fun b!140922 () Bool)

(declare-fun res!117513 () Bool)

(assert (=> b!140922 (=> (not res!117513) (not e!93883))))

(assert (=> b!140922 (= res!117513 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!12402 0))(
  ( (tuple2!12403 (_1!6531 BitStream!5098) (_2!6531 (_ BitVec 8))) )
))
(declare-fun lt!219196 () tuple2!12402)

(declare-datatypes ((tuple2!12404 0))(
  ( (tuple2!12405 (_1!6532 BitStream!5098) (_2!6532 BitStream!5098)) )
))
(declare-fun lt!219194 () tuple2!12404)

(declare-fun b!140923 () Bool)

(assert (=> b!140923 (= e!93881 (and (= (_2!6531 lt!219196) (select (arr!3627 arr!237) from!447)) (= (_1!6531 lt!219196) (_2!6532 lt!219194))))))

(declare-fun readBytePure!0 (BitStream!5098) tuple2!12402)

(assert (=> b!140923 (= lt!219196 (readBytePure!0 (_1!6532 lt!219194)))))

(declare-fun reader!0 (BitStream!5098 BitStream!5098) tuple2!12404)

(assert (=> b!140923 (= lt!219194 (reader!0 thiss!1634 (_2!6530 lt!219197)))))

(declare-fun b!140924 () Bool)

(assert (=> b!140924 (= e!93883 (not (or (not (= (bvand from!447 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand from!447 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)))))))

(assert (=> b!140924 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2920 (buf!3341 (_2!6530 lt!219197)))) ((_ sign_extend 32) (currentByte!6201 (_2!6530 lt!219197))) ((_ sign_extend 32) (currentBit!6196 (_2!6530 lt!219197))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219195 () Unit!8822)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5098 BitStream!5098 (_ BitVec 64) (_ BitVec 32)) Unit!8822)

(assert (=> b!140924 (= lt!219195 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6530 lt!219197) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!140924 e!93881))

(declare-fun res!117510 () Bool)

(assert (=> b!140924 (=> (not res!117510) (not e!93881))))

(assert (=> b!140924 (= res!117510 (= (size!2920 (buf!3341 thiss!1634)) (size!2920 (buf!3341 (_2!6530 lt!219197)))))))

(declare-fun appendByte!0 (BitStream!5098 (_ BitVec 8)) tuple2!12400)

(assert (=> b!140924 (= lt!219197 (appendByte!0 thiss!1634 (select (arr!3627 arr!237) from!447)))))

(assert (= (and start!27438 res!117512) b!140917))

(assert (= (and b!140917 res!117511) b!140922))

(assert (= (and b!140922 res!117513) b!140919))

(assert (= (and b!140919 res!117509) b!140924))

(assert (= (and b!140924 res!117510) b!140921))

(assert (= (and b!140921 res!117514) b!140920))

(assert (= (and b!140920 res!117508) b!140923))

(assert (= start!27438 b!140918))

(declare-fun m!216725 () Bool)

(assert (=> b!140921 m!216725))

(declare-fun m!216727 () Bool)

(assert (=> b!140921 m!216727))

(declare-fun m!216729 () Bool)

(assert (=> b!140919 m!216729))

(declare-fun m!216731 () Bool)

(assert (=> start!27438 m!216731))

(declare-fun m!216733 () Bool)

(assert (=> start!27438 m!216733))

(declare-fun m!216735 () Bool)

(assert (=> b!140918 m!216735))

(declare-fun m!216737 () Bool)

(assert (=> b!140917 m!216737))

(declare-fun m!216739 () Bool)

(assert (=> b!140923 m!216739))

(declare-fun m!216741 () Bool)

(assert (=> b!140923 m!216741))

(declare-fun m!216743 () Bool)

(assert (=> b!140923 m!216743))

(declare-fun m!216745 () Bool)

(assert (=> b!140920 m!216745))

(declare-fun m!216747 () Bool)

(assert (=> b!140924 m!216747))

(declare-fun m!216749 () Bool)

(assert (=> b!140924 m!216749))

(assert (=> b!140924 m!216739))

(assert (=> b!140924 m!216739))

(declare-fun m!216751 () Bool)

(assert (=> b!140924 m!216751))

(push 1)

(assert (not b!140921))

(assert (not b!140919))

(assert (not b!140920))

(assert (not b!140917))

(assert (not b!140918))

(assert (not start!27438))

(assert (not b!140923))

(assert (not b!140924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

