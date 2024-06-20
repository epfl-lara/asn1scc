; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18956 () Bool)

(assert start!18956)

(declare-fun b!94637 () Bool)

(declare-fun res!77964 () Bool)

(declare-fun e!62078 () Bool)

(assert (=> b!94637 (=> (not res!77964) (not e!62078))))

(declare-datatypes ((array!4425 0))(
  ( (array!4426 (arr!2622 (Array (_ BitVec 32) (_ BitVec 8))) (size!2014 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3532 0))(
  ( (BitStream!3533 (buf!2375 array!4425) (currentByte!4738 (_ BitVec 32)) (currentBit!4733 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3532)

(declare-fun bitStream2!8 () BitStream!3532)

(declare-fun isPrefixOf!0 (BitStream!3532 BitStream!3532) Bool)

(assert (=> b!94637 (= res!77964 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94638 () Bool)

(declare-fun res!77968 () Bool)

(assert (=> b!94638 (=> (not res!77968) (not e!62078))))

(declare-fun base!8 () BitStream!3532)

(assert (=> b!94638 (= res!77968 (and (= (buf!2375 bitStream1!8) (buf!2375 bitStream2!8)) (= (buf!2375 bitStream1!8) (buf!2375 base!8))))))

(declare-fun b!94639 () Bool)

(declare-fun res!77960 () Bool)

(assert (=> b!94639 (=> (not res!77960) (not e!62078))))

(assert (=> b!94639 (= res!77960 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94640 () Bool)

(declare-fun e!62071 () Bool)

(declare-fun array_inv!1831 (array!4425) Bool)

(assert (=> b!94640 (= e!62071 (array_inv!1831 (buf!2375 bitStream2!8)))))

(declare-fun b!94641 () Bool)

(declare-fun res!77967 () Bool)

(assert (=> b!94641 (=> (not res!77967) (not e!62078))))

(declare-datatypes ((List!872 0))(
  ( (Nil!869) (Cons!868 (h!987 Bool) (t!1622 List!872)) )
))
(declare-fun listBits!13 () List!872)

(declare-fun length!463 (List!872) Int)

(assert (=> b!94641 (= res!77967 (> (length!463 listBits!13) 0))))

(declare-fun res!77961 () Bool)

(assert (=> start!18956 (=> (not res!77961) (not e!62078))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18956 (= res!77961 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18956 e!62078))

(assert (=> start!18956 true))

(declare-fun e!62074 () Bool)

(declare-fun inv!12 (BitStream!3532) Bool)

(assert (=> start!18956 (and (inv!12 bitStream1!8) e!62074)))

(assert (=> start!18956 (and (inv!12 bitStream2!8) e!62071)))

(declare-fun e!62072 () Bool)

(assert (=> start!18956 (and (inv!12 base!8) e!62072)))

(declare-fun thiss!1534 () BitStream!3532)

(declare-fun e!62073 () Bool)

(assert (=> start!18956 (and (inv!12 thiss!1534) e!62073)))

(declare-fun b!94642 () Bool)

(declare-fun res!77962 () Bool)

(assert (=> b!94642 (=> (not res!77962) (not e!62078))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94642 (= res!77962 (validate_offset_bits!1 ((_ sign_extend 32) (size!2014 (buf!2375 bitStream2!8))) ((_ sign_extend 32) (currentByte!4738 bitStream2!8)) ((_ sign_extend 32) (currentBit!4733 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94643 () Bool)

(assert (=> b!94643 (= e!62078 false)))

(declare-datatypes ((tuple2!7660 0))(
  ( (tuple2!7661 (_1!4077 BitStream!3532) (_2!4077 Bool)) )
))
(declare-fun lt!138843 () tuple2!7660)

(declare-fun readBitPure!0 (BitStream!3532) tuple2!7660)

(assert (=> b!94643 (= lt!138843 (readBitPure!0 bitStream1!8))))

(declare-fun b!94644 () Bool)

(declare-fun res!77966 () Bool)

(assert (=> b!94644 (=> (not res!77966) (not e!62078))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94644 (= res!77966 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2014 (buf!2375 bitStream1!8)) (currentByte!4738 bitStream1!8) (currentBit!4733 bitStream1!8))) (bitIndex!0 (size!2014 (buf!2375 bitStream2!8)) (currentByte!4738 bitStream2!8) (currentBit!4733 bitStream2!8))))))

(declare-fun b!94645 () Bool)

(declare-fun res!77959 () Bool)

(assert (=> b!94645 (=> (not res!77959) (not e!62078))))

(assert (=> b!94645 (= res!77959 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94646 () Bool)

(assert (=> b!94646 (= e!62072 (array_inv!1831 (buf!2375 base!8)))))

(declare-fun b!94647 () Bool)

(assert (=> b!94647 (= e!62074 (array_inv!1831 (buf!2375 bitStream1!8)))))

(declare-fun b!94648 () Bool)

(declare-fun res!77969 () Bool)

(assert (=> b!94648 (=> (not res!77969) (not e!62078))))

(assert (=> b!94648 (= res!77969 (validate_offset_bits!1 ((_ sign_extend 32) (size!2014 (buf!2375 bitStream1!8))) ((_ sign_extend 32) (currentByte!4738 bitStream1!8)) ((_ sign_extend 32) (currentBit!4733 bitStream1!8)) nBits!484))))

(declare-fun b!94649 () Bool)

(assert (=> b!94649 (= e!62073 (array_inv!1831 (buf!2375 thiss!1534)))))

(declare-fun b!94650 () Bool)

(declare-fun res!77970 () Bool)

(assert (=> b!94650 (=> (not res!77970) (not e!62078))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3532 BitStream!3532 (_ BitVec 64)) List!872)

(assert (=> b!94650 (= res!77970 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94651 () Bool)

(declare-fun res!77965 () Bool)

(assert (=> b!94651 (=> (not res!77965) (not e!62078))))

(assert (=> b!94651 (= res!77965 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94652 () Bool)

(declare-fun res!77963 () Bool)

(assert (=> b!94652 (=> (not res!77963) (not e!62078))))

(assert (=> b!94652 (= res!77963 (bvslt (bitIndex!0 (size!2014 (buf!2375 base!8)) (currentByte!4738 base!8) (currentBit!4733 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(assert (= (and start!18956 res!77961) b!94641))

(assert (= (and b!94641 res!77967) b!94651))

(assert (= (and b!94651 res!77965) b!94639))

(assert (= (and b!94639 res!77960) b!94637))

(assert (= (and b!94637 res!77964) b!94638))

(assert (= (and b!94638 res!77968) b!94652))

(assert (= (and b!94652 res!77963) b!94644))

(assert (= (and b!94644 res!77966) b!94648))

(assert (= (and b!94648 res!77969) b!94642))

(assert (= (and b!94642 res!77962) b!94650))

(assert (= (and b!94650 res!77970) b!94645))

(assert (= (and b!94645 res!77959) b!94643))

(assert (= start!18956 b!94647))

(assert (= start!18956 b!94640))

(assert (= start!18956 b!94646))

(assert (= start!18956 b!94649))

(declare-fun m!138191 () Bool)

(assert (=> b!94651 m!138191))

(declare-fun m!138193 () Bool)

(assert (=> b!94647 m!138193))

(declare-fun m!138195 () Bool)

(assert (=> b!94640 m!138195))

(declare-fun m!138197 () Bool)

(assert (=> b!94650 m!138197))

(declare-fun m!138199 () Bool)

(assert (=> b!94643 m!138199))

(declare-fun m!138201 () Bool)

(assert (=> b!94641 m!138201))

(declare-fun m!138203 () Bool)

(assert (=> b!94646 m!138203))

(declare-fun m!138205 () Bool)

(assert (=> b!94639 m!138205))

(declare-fun m!138207 () Bool)

(assert (=> b!94649 m!138207))

(declare-fun m!138209 () Bool)

(assert (=> b!94648 m!138209))

(declare-fun m!138211 () Bool)

(assert (=> start!18956 m!138211))

(declare-fun m!138213 () Bool)

(assert (=> start!18956 m!138213))

(declare-fun m!138215 () Bool)

(assert (=> start!18956 m!138215))

(declare-fun m!138217 () Bool)

(assert (=> start!18956 m!138217))

(declare-fun m!138219 () Bool)

(assert (=> b!94644 m!138219))

(declare-fun m!138221 () Bool)

(assert (=> b!94644 m!138221))

(declare-fun m!138223 () Bool)

(assert (=> b!94637 m!138223))

(declare-fun m!138225 () Bool)

(assert (=> b!94642 m!138225))

(declare-fun m!138227 () Bool)

(assert (=> b!94652 m!138227))

(push 1)

(assert (not b!94637))

(assert (not b!94639))

(assert (not b!94647))

(assert (not b!94642))

(assert (not b!94648))

(assert (not b!94641))

(assert (not b!94646))

(assert (not b!94644))

(assert (not b!94651))

(assert (not b!94650))

(assert (not b!94649))

(assert (not b!94652))

(assert (not b!94643))

(assert (not b!94640))

(assert (not start!18956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

