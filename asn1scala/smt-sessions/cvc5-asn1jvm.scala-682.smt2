; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19130 () Bool)

(assert start!19130)

(declare-fun b!95637 () Bool)

(declare-fun res!78698 () Bool)

(declare-fun e!62677 () Bool)

(assert (=> b!95637 (=> (not res!78698) (not e!62677))))

(declare-datatypes ((array!4470 0))(
  ( (array!4471 (arr!2640 (Array (_ BitVec 32) (_ BitVec 8))) (size!2041 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3568 0))(
  ( (BitStream!3569 (buf!2393 array!4470) (currentByte!4771 (_ BitVec 32)) (currentBit!4766 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3568)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95637 (= res!78698 (bvslt (bitIndex!0 (size!2041 (buf!2393 base!8)) (currentByte!4771 base!8) (currentBit!4766 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95638 () Bool)

(declare-fun res!78704 () Bool)

(assert (=> b!95638 (=> (not res!78704) (not e!62677))))

(declare-fun bitStream1!8 () BitStream!3568)

(declare-fun bitStream2!8 () BitStream!3568)

(assert (=> b!95638 (= res!78704 (and (= (buf!2393 bitStream1!8) (buf!2393 bitStream2!8)) (= (buf!2393 bitStream1!8) (buf!2393 base!8))))))

(declare-fun b!95639 () Bool)

(declare-fun res!78705 () Bool)

(assert (=> b!95639 (=> (not res!78705) (not e!62677))))

(declare-fun isPrefixOf!0 (BitStream!3568 BitStream!3568) Bool)

(assert (=> b!95639 (= res!78705 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95640 () Bool)

(declare-fun res!78706 () Bool)

(assert (=> b!95640 (=> (not res!78706) (not e!62677))))

(assert (=> b!95640 (= res!78706 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95642 () Bool)

(declare-fun res!78699 () Bool)

(assert (=> b!95642 (=> (not res!78699) (not e!62677))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95642 (= res!78699 (validate_offset_bits!1 ((_ sign_extend 32) (size!2041 (buf!2393 bitStream2!8))) ((_ sign_extend 32) (currentByte!4771 bitStream2!8)) ((_ sign_extend 32) (currentBit!4766 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95643 () Bool)

(declare-fun e!62673 () Bool)

(declare-fun thiss!1534 () BitStream!3568)

(declare-fun array_inv!1849 (array!4470) Bool)

(assert (=> b!95643 (= e!62673 (array_inv!1849 (buf!2393 thiss!1534)))))

(declare-fun b!95644 () Bool)

(declare-fun e!62671 () Bool)

(assert (=> b!95644 (= e!62671 (array_inv!1849 (buf!2393 bitStream1!8)))))

(declare-fun b!95645 () Bool)

(declare-fun res!78707 () Bool)

(assert (=> b!95645 (=> (not res!78707) (not e!62677))))

(assert (=> b!95645 (= res!78707 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2041 (buf!2393 bitStream1!8)) (currentByte!4771 bitStream1!8) (currentBit!4766 bitStream1!8))) (bitIndex!0 (size!2041 (buf!2393 bitStream2!8)) (currentByte!4771 bitStream2!8) (currentBit!4766 bitStream2!8))))))

(declare-fun b!95646 () Bool)

(declare-fun e!62679 () Bool)

(assert (=> b!95646 (= e!62679 (array_inv!1849 (buf!2393 base!8)))))

(declare-fun b!95647 () Bool)

(assert (=> b!95647 (= e!62677 (and (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!95648 () Bool)

(declare-fun res!78702 () Bool)

(assert (=> b!95648 (=> (not res!78702) (not e!62677))))

(assert (=> b!95648 (= res!78702 (validate_offset_bits!1 ((_ sign_extend 32) (size!2041 (buf!2393 bitStream1!8))) ((_ sign_extend 32) (currentByte!4771 bitStream1!8)) ((_ sign_extend 32) (currentBit!4766 bitStream1!8)) nBits!484))))

(declare-fun b!95649 () Bool)

(declare-fun res!78703 () Bool)

(assert (=> b!95649 (=> (not res!78703) (not e!62677))))

(declare-datatypes ((List!890 0))(
  ( (Nil!887) (Cons!886 (h!1005 Bool) (t!1640 List!890)) )
))
(declare-fun listBits!13 () List!890)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3568 BitStream!3568 (_ BitVec 64)) List!890)

(assert (=> b!95649 (= res!78703 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun res!78708 () Bool)

(assert (=> start!19130 (=> (not res!78708) (not e!62677))))

(assert (=> start!19130 (= res!78708 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19130 e!62677))

(assert (=> start!19130 true))

(declare-fun inv!12 (BitStream!3568) Bool)

(assert (=> start!19130 (and (inv!12 bitStream1!8) e!62671)))

(declare-fun e!62672 () Bool)

(assert (=> start!19130 (and (inv!12 bitStream2!8) e!62672)))

(assert (=> start!19130 (and (inv!12 base!8) e!62679)))

(assert (=> start!19130 (and (inv!12 thiss!1534) e!62673)))

(declare-fun b!95641 () Bool)

(assert (=> b!95641 (= e!62672 (array_inv!1849 (buf!2393 bitStream2!8)))))

(declare-fun b!95650 () Bool)

(declare-fun res!78701 () Bool)

(assert (=> b!95650 (=> (not res!78701) (not e!62677))))

(assert (=> b!95650 (= res!78701 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95651 () Bool)

(declare-fun res!78700 () Bool)

(assert (=> b!95651 (=> (not res!78700) (not e!62677))))

(declare-fun length!481 (List!890) Int)

(assert (=> b!95651 (= res!78700 (> (length!481 listBits!13) 0))))

(assert (= (and start!19130 res!78708) b!95651))

(assert (= (and b!95651 res!78700) b!95639))

(assert (= (and b!95639 res!78705) b!95650))

(assert (= (and b!95650 res!78701) b!95640))

(assert (= (and b!95640 res!78706) b!95638))

(assert (= (and b!95638 res!78704) b!95637))

(assert (= (and b!95637 res!78698) b!95645))

(assert (= (and b!95645 res!78707) b!95648))

(assert (= (and b!95648 res!78702) b!95642))

(assert (= (and b!95642 res!78699) b!95649))

(assert (= (and b!95649 res!78703) b!95647))

(assert (= start!19130 b!95644))

(assert (= start!19130 b!95641))

(assert (= start!19130 b!95646))

(assert (= start!19130 b!95643))

(declare-fun m!139001 () Bool)

(assert (=> b!95643 m!139001))

(declare-fun m!139003 () Bool)

(assert (=> b!95642 m!139003))

(declare-fun m!139005 () Bool)

(assert (=> b!95648 m!139005))

(declare-fun m!139007 () Bool)

(assert (=> b!95639 m!139007))

(declare-fun m!139009 () Bool)

(assert (=> b!95651 m!139009))

(declare-fun m!139011 () Bool)

(assert (=> b!95640 m!139011))

(declare-fun m!139013 () Bool)

(assert (=> b!95644 m!139013))

(declare-fun m!139015 () Bool)

(assert (=> b!95637 m!139015))

(declare-fun m!139017 () Bool)

(assert (=> b!95641 m!139017))

(declare-fun m!139019 () Bool)

(assert (=> start!19130 m!139019))

(declare-fun m!139021 () Bool)

(assert (=> start!19130 m!139021))

(declare-fun m!139023 () Bool)

(assert (=> start!19130 m!139023))

(declare-fun m!139025 () Bool)

(assert (=> start!19130 m!139025))

(declare-fun m!139027 () Bool)

(assert (=> b!95649 m!139027))

(declare-fun m!139029 () Bool)

(assert (=> b!95650 m!139029))

(declare-fun m!139031 () Bool)

(assert (=> b!95646 m!139031))

(declare-fun m!139033 () Bool)

(assert (=> b!95645 m!139033))

(declare-fun m!139035 () Bool)

(assert (=> b!95645 m!139035))

(push 1)

(assert (not b!95641))

(assert (not b!95643))

(assert (not b!95637))

(assert (not b!95639))

(assert (not start!19130))

(assert (not b!95649))

(assert (not b!95640))

(assert (not b!95646))

(assert (not b!95650))

(assert (not b!95642))

(assert (not b!95645))

(assert (not b!95651))

(assert (not b!95644))

(assert (not b!95648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

