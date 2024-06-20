; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25438 () Bool)

(assert start!25438)

(declare-fun b!128349 () Bool)

(declare-fun res!106219 () Bool)

(declare-fun e!85083 () Bool)

(assert (=> b!128349 (=> (not res!106219) (not e!85083))))

(declare-datatypes ((array!5923 0))(
  ( (array!5924 (arr!3294 (Array (_ BitVec 32) (_ BitVec 8))) (size!2677 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4618 0))(
  ( (BitStream!4619 (buf!3035 array!5923) (currentByte!5796 (_ BitVec 32)) (currentBit!5791 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4618)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128349 (= res!106219 (invariant!0 (currentBit!5791 thiss!1634) (currentByte!5796 thiss!1634) (size!2677 (buf!3035 thiss!1634))))))

(declare-fun res!106216 () Bool)

(assert (=> start!25438 (=> (not res!106216) (not e!85083))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5923)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25438 (= res!106216 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2677 arr!237))))))

(assert (=> start!25438 e!85083))

(assert (=> start!25438 true))

(declare-fun array_inv!2466 (array!5923) Bool)

(assert (=> start!25438 (array_inv!2466 arr!237)))

(declare-fun e!85081 () Bool)

(declare-fun inv!12 (BitStream!4618) Bool)

(assert (=> start!25438 (and (inv!12 thiss!1634) e!85081)))

(declare-fun b!128350 () Bool)

(declare-fun e!85085 () Bool)

(assert (=> b!128350 (= e!85085 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5791 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5796 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2677 (buf!3035 thiss!1634))))))))

(declare-fun b!128351 () Bool)

(declare-fun e!85080 () Bool)

(declare-datatypes ((tuple2!10828 0))(
  ( (tuple2!10829 (_1!5711 BitStream!4618) (_2!5711 (_ BitVec 8))) )
))
(declare-fun lt!199402 () tuple2!10828)

(declare-datatypes ((tuple2!10830 0))(
  ( (tuple2!10831 (_1!5712 BitStream!4618) (_2!5712 BitStream!4618)) )
))
(declare-fun lt!199403 () tuple2!10830)

(assert (=> b!128351 (= e!85080 (and (= (_2!5711 lt!199402) (select (arr!3294 arr!237) from!447)) (= (_1!5711 lt!199402) (_2!5712 lt!199403))))))

(declare-fun readBytePure!0 (BitStream!4618) tuple2!10828)

(assert (=> b!128351 (= lt!199402 (readBytePure!0 (_1!5712 lt!199403)))))

(declare-datatypes ((Unit!7959 0))(
  ( (Unit!7960) )
))
(declare-datatypes ((tuple2!10832 0))(
  ( (tuple2!10833 (_1!5713 Unit!7959) (_2!5713 BitStream!4618)) )
))
(declare-fun lt!199401 () tuple2!10832)

(declare-fun reader!0 (BitStream!4618 BitStream!4618) tuple2!10830)

(assert (=> b!128351 (= lt!199403 (reader!0 thiss!1634 (_2!5713 lt!199401)))))

(declare-fun b!128352 () Bool)

(assert (=> b!128352 (= e!85083 (not e!85085))))

(declare-fun res!106220 () Bool)

(assert (=> b!128352 (=> res!106220 e!85085)))

(assert (=> b!128352 (= res!106220 (or (bvsgt ((_ sign_extend 32) (size!2677 (buf!3035 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5796 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5791 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!2677 (buf!3035 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5796 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5791 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128352 e!85080))

(declare-fun res!106217 () Bool)

(assert (=> b!128352 (=> (not res!106217) (not e!85080))))

(assert (=> b!128352 (= res!106217 (= (size!2677 (buf!3035 thiss!1634)) (size!2677 (buf!3035 (_2!5713 lt!199401)))))))

(declare-fun appendByte!0 (BitStream!4618 (_ BitVec 8)) tuple2!10832)

(assert (=> b!128352 (= lt!199401 (appendByte!0 thiss!1634 (select (arr!3294 arr!237) from!447)))))

(declare-fun b!128353 () Bool)

(assert (=> b!128353 (= e!85081 (array_inv!2466 (buf!3035 thiss!1634)))))

(declare-fun b!128354 () Bool)

(declare-fun res!106218 () Bool)

(assert (=> b!128354 (=> (not res!106218) (not e!85083))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128354 (= res!106218 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2677 (buf!3035 thiss!1634))) ((_ sign_extend 32) (currentByte!5796 thiss!1634)) ((_ sign_extend 32) (currentBit!5791 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128355 () Bool)

(declare-fun res!106222 () Bool)

(assert (=> b!128355 (=> (not res!106222) (not e!85080))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128355 (= res!106222 (= (bitIndex!0 (size!2677 (buf!3035 (_2!5713 lt!199401))) (currentByte!5796 (_2!5713 lt!199401)) (currentBit!5791 (_2!5713 lt!199401))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2677 (buf!3035 thiss!1634)) (currentByte!5796 thiss!1634) (currentBit!5791 thiss!1634)))))))

(declare-fun b!128356 () Bool)

(declare-fun res!106215 () Bool)

(assert (=> b!128356 (=> (not res!106215) (not e!85083))))

(assert (=> b!128356 (= res!106215 (bvslt from!447 to!404))))

(declare-fun b!128357 () Bool)

(declare-fun res!106221 () Bool)

(assert (=> b!128357 (=> (not res!106221) (not e!85080))))

(declare-fun isPrefixOf!0 (BitStream!4618 BitStream!4618) Bool)

(assert (=> b!128357 (= res!106221 (isPrefixOf!0 thiss!1634 (_2!5713 lt!199401)))))

(assert (= (and start!25438 res!106216) b!128354))

(assert (= (and b!128354 res!106218) b!128356))

(assert (= (and b!128356 res!106215) b!128349))

(assert (= (and b!128349 res!106219) b!128352))

(assert (= (and b!128352 res!106217) b!128355))

(assert (= (and b!128355 res!106222) b!128357))

(assert (= (and b!128357 res!106221) b!128351))

(assert (= (and b!128352 (not res!106220)) b!128350))

(assert (= start!25438 b!128353))

(declare-fun m!194143 () Bool)

(assert (=> b!128354 m!194143))

(declare-fun m!194145 () Bool)

(assert (=> start!25438 m!194145))

(declare-fun m!194147 () Bool)

(assert (=> start!25438 m!194147))

(declare-fun m!194149 () Bool)

(assert (=> b!128357 m!194149))

(declare-fun m!194151 () Bool)

(assert (=> b!128349 m!194151))

(declare-fun m!194153 () Bool)

(assert (=> b!128352 m!194153))

(assert (=> b!128352 m!194153))

(declare-fun m!194155 () Bool)

(assert (=> b!128352 m!194155))

(assert (=> b!128351 m!194153))

(declare-fun m!194157 () Bool)

(assert (=> b!128351 m!194157))

(declare-fun m!194159 () Bool)

(assert (=> b!128351 m!194159))

(declare-fun m!194161 () Bool)

(assert (=> b!128350 m!194161))

(declare-fun m!194163 () Bool)

(assert (=> b!128355 m!194163))

(declare-fun m!194165 () Bool)

(assert (=> b!128355 m!194165))

(declare-fun m!194167 () Bool)

(assert (=> b!128353 m!194167))

(push 1)

(assert (not start!25438))

(assert (not b!128352))

(assert (not b!128354))

(assert (not b!128351))

(assert (not b!128353))

(assert (not b!128355))

(assert (not b!128350))

(assert (not b!128349))

(assert (not b!128357))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

