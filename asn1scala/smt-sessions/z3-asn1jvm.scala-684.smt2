; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19216 () Bool)

(assert start!19216)

(declare-fun b!96200 () Bool)

(declare-fun res!79091 () Bool)

(declare-fun e!63026 () Bool)

(assert (=> b!96200 (=> (not res!79091) (not e!63026))))

(declare-datatypes ((array!4487 0))(
  ( (array!4488 (arr!2647 (Array (_ BitVec 32) (_ BitVec 8))) (size!2051 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3582 0))(
  ( (BitStream!3583 (buf!2400 array!4487) (currentByte!4788 (_ BitVec 32)) (currentBit!4783 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3582)

(declare-fun base!8 () BitStream!3582)

(declare-fun isPrefixOf!0 (BitStream!3582 BitStream!3582) Bool)

(assert (=> b!96200 (= res!79091 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!96201 () Bool)

(declare-fun e!63020 () Bool)

(declare-fun bitStream2!8 () BitStream!3582)

(declare-fun array_inv!1856 (array!4487) Bool)

(assert (=> b!96201 (= e!63020 (array_inv!1856 (buf!2400 bitStream2!8)))))

(declare-fun b!96202 () Bool)

(declare-fun e!63025 () Bool)

(declare-fun thiss!1534 () BitStream!3582)

(assert (=> b!96202 (= e!63025 (array_inv!1856 (buf!2400 thiss!1534)))))

(declare-fun b!96203 () Bool)

(declare-fun res!79093 () Bool)

(assert (=> b!96203 (=> (not res!79093) (not e!63026))))

(assert (=> b!96203 (= res!79093 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!96204 () Bool)

(declare-fun res!79083 () Bool)

(assert (=> b!96204 (=> (not res!79083) (not e!63026))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!96204 (= res!79083 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!96205 () Bool)

(declare-fun res!79084 () Bool)

(assert (=> b!96205 (=> (not res!79084) (not e!63026))))

(assert (=> b!96205 (= res!79084 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!96206 () Bool)

(declare-fun res!79085 () Bool)

(assert (=> b!96206 (=> (not res!79085) (not e!63026))))

(declare-datatypes ((List!897 0))(
  ( (Nil!894) (Cons!893 (h!1012 Bool) (t!1647 List!897)) )
))
(declare-fun listBits!13 () List!897)

(declare-datatypes ((tuple2!7720 0))(
  ( (tuple2!7721 (_1!4109 BitStream!3582) (_2!4109 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3582) tuple2!7720)

(declare-fun head!594 (List!897) Bool)

(assert (=> b!96206 (= res!79085 (= (_2!4109 (readBitPure!0 bitStream1!8)) (head!594 listBits!13)))))

(declare-fun b!96207 () Bool)

(declare-fun res!79082 () Bool)

(assert (=> b!96207 (=> (not res!79082) (not e!63026))))

(declare-fun length!488 (List!897) Int)

(assert (=> b!96207 (= res!79082 (> (length!488 listBits!13) 0))))

(declare-fun b!96208 () Bool)

(declare-fun res!79088 () Bool)

(assert (=> b!96208 (=> (not res!79088) (not e!63026))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96208 (= res!79088 (validate_offset_bits!1 ((_ sign_extend 32) (size!2051 (buf!2400 bitStream2!8))) ((_ sign_extend 32) (currentByte!4788 bitStream2!8)) ((_ sign_extend 32) (currentBit!4783 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!79087 () Bool)

(assert (=> start!19216 (=> (not res!79087) (not e!63026))))

(assert (=> start!19216 (= res!79087 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19216 e!63026))

(assert (=> start!19216 true))

(declare-fun e!63021 () Bool)

(declare-fun inv!12 (BitStream!3582) Bool)

(assert (=> start!19216 (and (inv!12 bitStream1!8) e!63021)))

(assert (=> start!19216 (and (inv!12 bitStream2!8) e!63020)))

(declare-fun e!63019 () Bool)

(assert (=> start!19216 (and (inv!12 base!8) e!63019)))

(assert (=> start!19216 (and (inv!12 thiss!1534) e!63025)))

(declare-fun b!96209 () Bool)

(assert (=> b!96209 (= e!63019 (array_inv!1856 (buf!2400 base!8)))))

(declare-fun b!96210 () Bool)

(declare-fun res!79089 () Bool)

(assert (=> b!96210 (=> (not res!79089) (not e!63026))))

(assert (=> b!96210 (= res!79089 (validate_offset_bits!1 ((_ sign_extend 32) (size!2051 (buf!2400 bitStream1!8))) ((_ sign_extend 32) (currentByte!4788 bitStream1!8)) ((_ sign_extend 32) (currentBit!4783 bitStream1!8)) nBits!484))))

(declare-fun b!96211 () Bool)

(declare-fun res!79086 () Bool)

(assert (=> b!96211 (=> (not res!79086) (not e!63026))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96211 (= res!79086 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2051 (buf!2400 bitStream1!8)) (currentByte!4788 bitStream1!8) (currentBit!4783 bitStream1!8))) (bitIndex!0 (size!2051 (buf!2400 bitStream2!8)) (currentByte!4788 bitStream2!8) (currentBit!4783 bitStream2!8))))))

(declare-fun b!96212 () Bool)

(declare-fun res!79081 () Bool)

(assert (=> b!96212 (=> (not res!79081) (not e!63026))))

(assert (=> b!96212 (= res!79081 (and (= (buf!2400 bitStream1!8) (buf!2400 bitStream2!8)) (= (buf!2400 bitStream1!8) (buf!2400 base!8))))))

(declare-fun b!96213 () Bool)

(declare-fun res!79090 () Bool)

(assert (=> b!96213 (=> (not res!79090) (not e!63026))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3582 BitStream!3582 (_ BitVec 64)) List!897)

(assert (=> b!96213 (= res!79090 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!96214 () Bool)

(assert (=> b!96214 (= e!63021 (array_inv!1856 (buf!2400 bitStream1!8)))))

(declare-fun b!96215 () Bool)

(declare-fun res!79092 () Bool)

(assert (=> b!96215 (=> (not res!79092) (not e!63026))))

(assert (=> b!96215 (= res!79092 (bvslt (bitIndex!0 (size!2051 (buf!2400 base!8)) (currentByte!4788 base!8) (currentBit!4783 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!96216 () Bool)

(assert (=> b!96216 (= e!63026 (and (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!19216 res!79087) b!96207))

(assert (= (and b!96207 res!79082) b!96200))

(assert (= (and b!96200 res!79091) b!96205))

(assert (= (and b!96205 res!79084) b!96203))

(assert (= (and b!96203 res!79093) b!96212))

(assert (= (and b!96212 res!79081) b!96215))

(assert (= (and b!96215 res!79092) b!96211))

(assert (= (and b!96211 res!79086) b!96210))

(assert (= (and b!96210 res!79089) b!96208))

(assert (= (and b!96208 res!79088) b!96213))

(assert (= (and b!96213 res!79090) b!96204))

(assert (= (and b!96204 res!79083) b!96206))

(assert (= (and b!96206 res!79085) b!96216))

(assert (= start!19216 b!96214))

(assert (= start!19216 b!96201))

(assert (= start!19216 b!96209))

(assert (= start!19216 b!96202))

(declare-fun m!139559 () Bool)

(assert (=> b!96202 m!139559))

(declare-fun m!139561 () Bool)

(assert (=> b!96208 m!139561))

(declare-fun m!139563 () Bool)

(assert (=> b!96205 m!139563))

(declare-fun m!139565 () Bool)

(assert (=> b!96201 m!139565))

(declare-fun m!139567 () Bool)

(assert (=> b!96209 m!139567))

(declare-fun m!139569 () Bool)

(assert (=> b!96200 m!139569))

(declare-fun m!139571 () Bool)

(assert (=> b!96206 m!139571))

(declare-fun m!139573 () Bool)

(assert (=> b!96206 m!139573))

(declare-fun m!139575 () Bool)

(assert (=> b!96215 m!139575))

(declare-fun m!139577 () Bool)

(assert (=> b!96203 m!139577))

(declare-fun m!139579 () Bool)

(assert (=> b!96210 m!139579))

(declare-fun m!139581 () Bool)

(assert (=> start!19216 m!139581))

(declare-fun m!139583 () Bool)

(assert (=> start!19216 m!139583))

(declare-fun m!139585 () Bool)

(assert (=> start!19216 m!139585))

(declare-fun m!139587 () Bool)

(assert (=> start!19216 m!139587))

(declare-fun m!139589 () Bool)

(assert (=> b!96213 m!139589))

(declare-fun m!139591 () Bool)

(assert (=> b!96207 m!139591))

(declare-fun m!139593 () Bool)

(assert (=> b!96211 m!139593))

(declare-fun m!139595 () Bool)

(assert (=> b!96211 m!139595))

(declare-fun m!139597 () Bool)

(assert (=> b!96214 m!139597))

(check-sat (not start!19216) (not b!96207) (not b!96206) (not b!96213) (not b!96209) (not b!96202) (not b!96200) (not b!96211) (not b!96215) (not b!96203) (not b!96214) (not b!96210) (not b!96201) (not b!96208) (not b!96205))
(check-sat)
