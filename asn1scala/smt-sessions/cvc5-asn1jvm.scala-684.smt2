; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19214 () Bool)

(assert start!19214)

(declare-fun b!96149 () Bool)

(declare-fun res!79049 () Bool)

(declare-fun e!62996 () Bool)

(assert (=> b!96149 (=> (not res!79049) (not e!62996))))

(declare-datatypes ((array!4485 0))(
  ( (array!4486 (arr!2646 (Array (_ BitVec 32) (_ BitVec 8))) (size!2050 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3580 0))(
  ( (BitStream!3581 (buf!2399 array!4485) (currentByte!4787 (_ BitVec 32)) (currentBit!4782 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3580)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96149 (= res!79049 (validate_offset_bits!1 ((_ sign_extend 32) (size!2050 (buf!2399 bitStream1!8))) ((_ sign_extend 32) (currentByte!4787 bitStream1!8)) ((_ sign_extend 32) (currentBit!4782 bitStream1!8)) nBits!484))))

(declare-fun b!96150 () Bool)

(declare-fun e!62999 () Bool)

(declare-fun bitStream2!8 () BitStream!3580)

(declare-fun array_inv!1855 (array!4485) Bool)

(assert (=> b!96150 (= e!62999 (array_inv!1855 (buf!2399 bitStream2!8)))))

(declare-fun b!96151 () Bool)

(assert (=> b!96151 (= e!62996 (and (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!96152 () Bool)

(declare-fun e!62997 () Bool)

(declare-fun thiss!1534 () BitStream!3580)

(assert (=> b!96152 (= e!62997 (array_inv!1855 (buf!2399 thiss!1534)))))

(declare-fun b!96153 () Bool)

(declare-fun res!79045 () Bool)

(assert (=> b!96153 (=> (not res!79045) (not e!62996))))

(declare-datatypes ((List!896 0))(
  ( (Nil!893) (Cons!892 (h!1011 Bool) (t!1646 List!896)) )
))
(declare-fun listBits!13 () List!896)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3580 BitStream!3580 (_ BitVec 64)) List!896)

(assert (=> b!96153 (= res!79045 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!96154 () Bool)

(declare-fun res!79050 () Bool)

(assert (=> b!96154 (=> (not res!79050) (not e!62996))))

(declare-fun base!8 () BitStream!3580)

(declare-fun isPrefixOf!0 (BitStream!3580 BitStream!3580) Bool)

(assert (=> b!96154 (= res!79050 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!96155 () Bool)

(declare-fun res!79051 () Bool)

(assert (=> b!96155 (=> (not res!79051) (not e!62996))))

(assert (=> b!96155 (= res!79051 (and (= (buf!2399 bitStream1!8) (buf!2399 bitStream2!8)) (= (buf!2399 bitStream1!8) (buf!2399 base!8))))))

(declare-fun b!96156 () Bool)

(declare-fun res!79052 () Bool)

(assert (=> b!96156 (=> (not res!79052) (not e!62996))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96156 (= res!79052 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2050 (buf!2399 bitStream1!8)) (currentByte!4787 bitStream1!8) (currentBit!4782 bitStream1!8))) (bitIndex!0 (size!2050 (buf!2399 bitStream2!8)) (currentByte!4787 bitStream2!8) (currentBit!4782 bitStream2!8))))))

(declare-fun res!79046 () Bool)

(assert (=> start!19214 (=> (not res!79046) (not e!62996))))

(assert (=> start!19214 (= res!79046 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19214 e!62996))

(assert (=> start!19214 true))

(declare-fun e!62993 () Bool)

(declare-fun inv!12 (BitStream!3580) Bool)

(assert (=> start!19214 (and (inv!12 bitStream1!8) e!62993)))

(assert (=> start!19214 (and (inv!12 bitStream2!8) e!62999)))

(declare-fun e!62992 () Bool)

(assert (=> start!19214 (and (inv!12 base!8) e!62992)))

(assert (=> start!19214 (and (inv!12 thiss!1534) e!62997)))

(declare-fun b!96157 () Bool)

(assert (=> b!96157 (= e!62993 (array_inv!1855 (buf!2399 bitStream1!8)))))

(declare-fun b!96158 () Bool)

(declare-fun res!79043 () Bool)

(assert (=> b!96158 (=> (not res!79043) (not e!62996))))

(declare-datatypes ((tuple2!7718 0))(
  ( (tuple2!7719 (_1!4108 BitStream!3580) (_2!4108 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3580) tuple2!7718)

(declare-fun head!593 (List!896) Bool)

(assert (=> b!96158 (= res!79043 (= (_2!4108 (readBitPure!0 bitStream1!8)) (head!593 listBits!13)))))

(declare-fun b!96159 () Bool)

(assert (=> b!96159 (= e!62992 (array_inv!1855 (buf!2399 base!8)))))

(declare-fun b!96160 () Bool)

(declare-fun res!79047 () Bool)

(assert (=> b!96160 (=> (not res!79047) (not e!62996))))

(declare-fun length!487 (List!896) Int)

(assert (=> b!96160 (= res!79047 (> (length!487 listBits!13) 0))))

(declare-fun b!96161 () Bool)

(declare-fun res!79042 () Bool)

(assert (=> b!96161 (=> (not res!79042) (not e!62996))))

(assert (=> b!96161 (= res!79042 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96162 () Bool)

(declare-fun res!79054 () Bool)

(assert (=> b!96162 (=> (not res!79054) (not e!62996))))

(assert (=> b!96162 (= res!79054 (validate_offset_bits!1 ((_ sign_extend 32) (size!2050 (buf!2399 bitStream2!8))) ((_ sign_extend 32) (currentByte!4787 bitStream2!8)) ((_ sign_extend 32) (currentBit!4782 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96163 () Bool)

(declare-fun res!79048 () Bool)

(assert (=> b!96163 (=> (not res!79048) (not e!62996))))

(assert (=> b!96163 (= res!79048 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!96164 () Bool)

(declare-fun res!79044 () Bool)

(assert (=> b!96164 (=> (not res!79044) (not e!62996))))

(assert (=> b!96164 (= res!79044 (bvslt (bitIndex!0 (size!2050 (buf!2399 base!8)) (currentByte!4787 base!8) (currentBit!4782 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!96165 () Bool)

(declare-fun res!79053 () Bool)

(assert (=> b!96165 (=> (not res!79053) (not e!62996))))

(assert (=> b!96165 (= res!79053 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!19214 res!79046) b!96160))

(assert (= (and b!96160 res!79047) b!96163))

(assert (= (and b!96163 res!79048) b!96154))

(assert (= (and b!96154 res!79050) b!96165))

(assert (= (and b!96165 res!79053) b!96155))

(assert (= (and b!96155 res!79051) b!96164))

(assert (= (and b!96164 res!79044) b!96156))

(assert (= (and b!96156 res!79052) b!96149))

(assert (= (and b!96149 res!79049) b!96162))

(assert (= (and b!96162 res!79054) b!96153))

(assert (= (and b!96153 res!79045) b!96161))

(assert (= (and b!96161 res!79042) b!96158))

(assert (= (and b!96158 res!79043) b!96151))

(assert (= start!19214 b!96157))

(assert (= start!19214 b!96150))

(assert (= start!19214 b!96159))

(assert (= start!19214 b!96152))

(declare-fun m!139519 () Bool)

(assert (=> b!96150 m!139519))

(declare-fun m!139521 () Bool)

(assert (=> b!96158 m!139521))

(declare-fun m!139523 () Bool)

(assert (=> b!96158 m!139523))

(declare-fun m!139525 () Bool)

(assert (=> b!96159 m!139525))

(declare-fun m!139527 () Bool)

(assert (=> b!96162 m!139527))

(declare-fun m!139529 () Bool)

(assert (=> b!96149 m!139529))

(declare-fun m!139531 () Bool)

(assert (=> b!96152 m!139531))

(declare-fun m!139533 () Bool)

(assert (=> b!96164 m!139533))

(declare-fun m!139535 () Bool)

(assert (=> start!19214 m!139535))

(declare-fun m!139537 () Bool)

(assert (=> start!19214 m!139537))

(declare-fun m!139539 () Bool)

(assert (=> start!19214 m!139539))

(declare-fun m!139541 () Bool)

(assert (=> start!19214 m!139541))

(declare-fun m!139543 () Bool)

(assert (=> b!96160 m!139543))

(declare-fun m!139545 () Bool)

(assert (=> b!96165 m!139545))

(declare-fun m!139547 () Bool)

(assert (=> b!96154 m!139547))

(declare-fun m!139549 () Bool)

(assert (=> b!96153 m!139549))

(declare-fun m!139551 () Bool)

(assert (=> b!96156 m!139551))

(declare-fun m!139553 () Bool)

(assert (=> b!96156 m!139553))

(declare-fun m!139555 () Bool)

(assert (=> b!96163 m!139555))

(declare-fun m!139557 () Bool)

(assert (=> b!96157 m!139557))

(push 1)

(assert (not b!96159))

(assert (not b!96165))

(assert (not b!96157))

(assert (not b!96164))

(assert (not b!96160))

(assert (not start!19214))

(assert (not b!96153))

(assert (not b!96150))

(assert (not b!96162))

(assert (not b!96152))

(assert (not b!96156))

(assert (not b!96158))

(assert (not b!96154))

(assert (not b!96163))

(assert (not b!96149))

(check-sat)

(pop 1)

(push 1)

(check-sat)

