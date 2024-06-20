; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19126 () Bool)

(assert start!19126)

(declare-fun b!95559 () Bool)

(declare-fun e!62629 () Bool)

(declare-datatypes ((array!4466 0))(
  ( (array!4467 (arr!2638 (Array (_ BitVec 32) (_ BitVec 8))) (size!2039 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3564 0))(
  ( (BitStream!3565 (buf!2391 array!4466) (currentByte!4769 (_ BitVec 32)) (currentBit!4764 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3564)

(declare-fun array_inv!1847 (array!4466) Bool)

(assert (=> b!95559 (= e!62629 (array_inv!1847 (buf!2391 bitStream1!8)))))

(declare-fun b!95560 () Bool)

(declare-fun res!78646 () Bool)

(declare-fun e!62626 () Bool)

(assert (=> b!95560 (=> (not res!78646) (not e!62626))))

(declare-fun bitStream2!8 () BitStream!3564)

(declare-fun base!8 () BitStream!3564)

(assert (=> b!95560 (= res!78646 (and (= (buf!2391 bitStream1!8) (buf!2391 bitStream2!8)) (= (buf!2391 bitStream1!8) (buf!2391 base!8))))))

(declare-fun b!95561 () Bool)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!95561 (= e!62626 (and (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!78643 () Bool)

(assert (=> start!19126 (=> (not res!78643) (not e!62626))))

(assert (=> start!19126 (= res!78643 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19126 e!62626))

(assert (=> start!19126 true))

(declare-fun inv!12 (BitStream!3564) Bool)

(assert (=> start!19126 (and (inv!12 bitStream1!8) e!62629)))

(declare-fun e!62631 () Bool)

(assert (=> start!19126 (and (inv!12 bitStream2!8) e!62631)))

(declare-fun e!62630 () Bool)

(assert (=> start!19126 (and (inv!12 base!8) e!62630)))

(declare-fun b!95562 () Bool)

(declare-fun res!78641 () Bool)

(assert (=> b!95562 (=> (not res!78641) (not e!62626))))

(declare-fun isPrefixOf!0 (BitStream!3564 BitStream!3564) Bool)

(assert (=> b!95562 (= res!78641 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95563 () Bool)

(assert (=> b!95563 (= e!62630 (array_inv!1847 (buf!2391 base!8)))))

(declare-fun b!95564 () Bool)

(declare-fun res!78645 () Bool)

(assert (=> b!95564 (=> (not res!78645) (not e!62626))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95564 (= res!78645 (bvslt (bitIndex!0 (size!2039 (buf!2391 base!8)) (currentByte!4769 base!8) (currentBit!4764 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!95565 () Bool)

(assert (=> b!95565 (= e!62631 (array_inv!1847 (buf!2391 bitStream2!8)))))

(declare-fun b!95566 () Bool)

(declare-fun res!78644 () Bool)

(assert (=> b!95566 (=> (not res!78644) (not e!62626))))

(assert (=> b!95566 (= res!78644 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95567 () Bool)

(declare-fun res!78647 () Bool)

(assert (=> b!95567 (=> (not res!78647) (not e!62626))))

(assert (=> b!95567 (= res!78647 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2039 (buf!2391 bitStream1!8)) (currentByte!4769 bitStream1!8) (currentBit!4764 bitStream1!8))) (bitIndex!0 (size!2039 (buf!2391 bitStream2!8)) (currentByte!4769 bitStream2!8) (currentBit!4764 bitStream2!8))))))

(declare-fun b!95568 () Bool)

(declare-fun res!78642 () Bool)

(assert (=> b!95568 (=> (not res!78642) (not e!62626))))

(declare-datatypes ((List!888 0))(
  ( (Nil!885) (Cons!884 (h!1003 Bool) (t!1638 List!888)) )
))
(declare-fun listBits!13 () List!888)

(declare-fun length!479 (List!888) Int)

(assert (=> b!95568 (= res!78642 (> (length!479 listBits!13) 0))))

(declare-fun b!95569 () Bool)

(declare-fun res!78640 () Bool)

(assert (=> b!95569 (=> (not res!78640) (not e!62626))))

(assert (=> b!95569 (= res!78640 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95570 () Bool)

(declare-fun res!78648 () Bool)

(assert (=> b!95570 (=> (not res!78648) (not e!62626))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95570 (= res!78648 (validate_offset_bits!1 ((_ sign_extend 32) (size!2039 (buf!2391 bitStream1!8))) ((_ sign_extend 32) (currentByte!4769 bitStream1!8)) ((_ sign_extend 32) (currentBit!4764 bitStream1!8)) nBits!484))))

(assert (= (and start!19126 res!78643) b!95568))

(assert (= (and b!95568 res!78642) b!95562))

(assert (= (and b!95562 res!78641) b!95566))

(assert (= (and b!95566 res!78644) b!95569))

(assert (= (and b!95569 res!78640) b!95560))

(assert (= (and b!95560 res!78646) b!95564))

(assert (= (and b!95564 res!78645) b!95567))

(assert (= (and b!95567 res!78647) b!95570))

(assert (= (and b!95570 res!78648) b!95561))

(assert (= start!19126 b!95559))

(assert (= start!19126 b!95565))

(assert (= start!19126 b!95563))

(declare-fun m!138945 () Bool)

(assert (=> b!95562 m!138945))

(declare-fun m!138947 () Bool)

(assert (=> start!19126 m!138947))

(declare-fun m!138949 () Bool)

(assert (=> start!19126 m!138949))

(declare-fun m!138951 () Bool)

(assert (=> start!19126 m!138951))

(declare-fun m!138953 () Bool)

(assert (=> b!95568 m!138953))

(declare-fun m!138955 () Bool)

(assert (=> b!95564 m!138955))

(declare-fun m!138957 () Bool)

(assert (=> b!95565 m!138957))

(declare-fun m!138959 () Bool)

(assert (=> b!95566 m!138959))

(declare-fun m!138961 () Bool)

(assert (=> b!95567 m!138961))

(declare-fun m!138963 () Bool)

(assert (=> b!95567 m!138963))

(declare-fun m!138965 () Bool)

(assert (=> b!95563 m!138965))

(declare-fun m!138967 () Bool)

(assert (=> b!95569 m!138967))

(declare-fun m!138969 () Bool)

(assert (=> b!95559 m!138969))

(declare-fun m!138971 () Bool)

(assert (=> b!95570 m!138971))

(check-sat (not b!95568) (not b!95564) (not b!95566) (not start!19126) (not b!95562) (not b!95565) (not b!95567) (not b!95569) (not b!95563) (not b!95570) (not b!95559))
(check-sat)
