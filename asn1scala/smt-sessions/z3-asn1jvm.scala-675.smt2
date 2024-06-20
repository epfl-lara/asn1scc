; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18952 () Bool)

(assert start!18952)

(declare-fun b!94542 () Bool)

(declare-fun res!77898 () Bool)

(declare-fun e!62021 () Bool)

(assert (=> b!94542 (=> (not res!77898) (not e!62021))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!94542 (= res!77898 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94543 () Bool)

(declare-fun res!77890 () Bool)

(assert (=> b!94543 (=> (not res!77890) (not e!62021))))

(declare-datatypes ((array!4421 0))(
  ( (array!4422 (arr!2620 (Array (_ BitVec 32) (_ BitVec 8))) (size!2012 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3528 0))(
  ( (BitStream!3529 (buf!2373 array!4421) (currentByte!4736 (_ BitVec 32)) (currentBit!4731 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3528)

(declare-datatypes ((List!870 0))(
  ( (Nil!867) (Cons!866 (h!985 Bool) (t!1620 List!870)) )
))
(declare-fun listBits!13 () List!870)

(declare-fun thiss!1534 () BitStream!3528)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3528 BitStream!3528 (_ BitVec 64)) List!870)

(assert (=> b!94543 (= res!77890 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94544 () Bool)

(declare-fun res!77896 () Bool)

(assert (=> b!94544 (=> (not res!77896) (not e!62021))))

(declare-fun bitStream2!8 () BitStream!3528)

(declare-fun base!8 () BitStream!3528)

(declare-fun isPrefixOf!0 (BitStream!3528 BitStream!3528) Bool)

(assert (=> b!94544 (= res!77896 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94545 () Bool)

(assert (=> b!94545 (= e!62021 false)))

(declare-datatypes ((tuple2!7656 0))(
  ( (tuple2!7657 (_1!4075 BitStream!3528) (_2!4075 Bool)) )
))
(declare-fun lt!138837 () tuple2!7656)

(declare-fun readBitPure!0 (BitStream!3528) tuple2!7656)

(assert (=> b!94545 (= lt!138837 (readBitPure!0 bitStream1!8))))

(declare-fun b!94546 () Bool)

(declare-fun res!77887 () Bool)

(assert (=> b!94546 (=> (not res!77887) (not e!62021))))

(assert (=> b!94546 (= res!77887 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94547 () Bool)

(declare-fun res!77889 () Bool)

(assert (=> b!94547 (=> (not res!77889) (not e!62021))))

(assert (=> b!94547 (= res!77889 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94548 () Bool)

(declare-fun res!77895 () Bool)

(assert (=> b!94548 (=> (not res!77895) (not e!62021))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94548 (= res!77895 (validate_offset_bits!1 ((_ sign_extend 32) (size!2012 (buf!2373 bitStream1!8))) ((_ sign_extend 32) (currentByte!4736 bitStream1!8)) ((_ sign_extend 32) (currentBit!4731 bitStream1!8)) nBits!484))))

(declare-fun b!94549 () Bool)

(declare-fun res!77888 () Bool)

(assert (=> b!94549 (=> (not res!77888) (not e!62021))))

(assert (=> b!94549 (= res!77888 (validate_offset_bits!1 ((_ sign_extend 32) (size!2012 (buf!2373 bitStream2!8))) ((_ sign_extend 32) (currentByte!4736 bitStream2!8)) ((_ sign_extend 32) (currentBit!4731 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94550 () Bool)

(declare-fun res!77894 () Bool)

(assert (=> b!94550 (=> (not res!77894) (not e!62021))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94550 (= res!77894 (bvslt (bitIndex!0 (size!2012 (buf!2373 base!8)) (currentByte!4736 base!8) (currentBit!4731 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94551 () Bool)

(declare-fun res!77893 () Bool)

(assert (=> b!94551 (=> (not res!77893) (not e!62021))))

(assert (=> b!94551 (= res!77893 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2012 (buf!2373 bitStream1!8)) (currentByte!4736 bitStream1!8) (currentBit!4731 bitStream1!8))) (bitIndex!0 (size!2012 (buf!2373 bitStream2!8)) (currentByte!4736 bitStream2!8) (currentBit!4731 bitStream2!8))))))

(declare-fun b!94552 () Bool)

(declare-fun e!62023 () Bool)

(declare-fun array_inv!1829 (array!4421) Bool)

(assert (=> b!94552 (= e!62023 (array_inv!1829 (buf!2373 bitStream2!8)))))

(declare-fun b!94541 () Bool)

(declare-fun res!77892 () Bool)

(assert (=> b!94541 (=> (not res!77892) (not e!62021))))

(declare-fun length!461 (List!870) Int)

(assert (=> b!94541 (= res!77892 (> (length!461 listBits!13) 0))))

(declare-fun res!77897 () Bool)

(assert (=> start!18952 (=> (not res!77897) (not e!62021))))

(assert (=> start!18952 (= res!77897 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18952 e!62021))

(assert (=> start!18952 true))

(declare-fun e!62017 () Bool)

(declare-fun inv!12 (BitStream!3528) Bool)

(assert (=> start!18952 (and (inv!12 bitStream1!8) e!62017)))

(assert (=> start!18952 (and (inv!12 bitStream2!8) e!62023)))

(declare-fun e!62025 () Bool)

(assert (=> start!18952 (and (inv!12 base!8) e!62025)))

(declare-fun e!62024 () Bool)

(assert (=> start!18952 (and (inv!12 thiss!1534) e!62024)))

(declare-fun b!94553 () Bool)

(declare-fun res!77891 () Bool)

(assert (=> b!94553 (=> (not res!77891) (not e!62021))))

(assert (=> b!94553 (= res!77891 (and (= (buf!2373 bitStream1!8) (buf!2373 bitStream2!8)) (= (buf!2373 bitStream1!8) (buf!2373 base!8))))))

(declare-fun b!94554 () Bool)

(assert (=> b!94554 (= e!62024 (array_inv!1829 (buf!2373 thiss!1534)))))

(declare-fun b!94555 () Bool)

(assert (=> b!94555 (= e!62025 (array_inv!1829 (buf!2373 base!8)))))

(declare-fun b!94556 () Bool)

(assert (=> b!94556 (= e!62017 (array_inv!1829 (buf!2373 bitStream1!8)))))

(assert (= (and start!18952 res!77897) b!94541))

(assert (= (and b!94541 res!77892) b!94546))

(assert (= (and b!94546 res!77887) b!94544))

(assert (= (and b!94544 res!77896) b!94547))

(assert (= (and b!94547 res!77889) b!94553))

(assert (= (and b!94553 res!77891) b!94550))

(assert (= (and b!94550 res!77894) b!94551))

(assert (= (and b!94551 res!77893) b!94548))

(assert (= (and b!94548 res!77895) b!94549))

(assert (= (and b!94549 res!77888) b!94543))

(assert (= (and b!94543 res!77890) b!94542))

(assert (= (and b!94542 res!77898) b!94545))

(assert (= start!18952 b!94556))

(assert (= start!18952 b!94552))

(assert (= start!18952 b!94555))

(assert (= start!18952 b!94554))

(declare-fun m!138115 () Bool)

(assert (=> b!94545 m!138115))

(declare-fun m!138117 () Bool)

(assert (=> start!18952 m!138117))

(declare-fun m!138119 () Bool)

(assert (=> start!18952 m!138119))

(declare-fun m!138121 () Bool)

(assert (=> start!18952 m!138121))

(declare-fun m!138123 () Bool)

(assert (=> start!18952 m!138123))

(declare-fun m!138125 () Bool)

(assert (=> b!94550 m!138125))

(declare-fun m!138127 () Bool)

(assert (=> b!94543 m!138127))

(declare-fun m!138129 () Bool)

(assert (=> b!94544 m!138129))

(declare-fun m!138131 () Bool)

(assert (=> b!94556 m!138131))

(declare-fun m!138133 () Bool)

(assert (=> b!94551 m!138133))

(declare-fun m!138135 () Bool)

(assert (=> b!94551 m!138135))

(declare-fun m!138137 () Bool)

(assert (=> b!94541 m!138137))

(declare-fun m!138139 () Bool)

(assert (=> b!94547 m!138139))

(declare-fun m!138141 () Bool)

(assert (=> b!94554 m!138141))

(declare-fun m!138143 () Bool)

(assert (=> b!94552 m!138143))

(declare-fun m!138145 () Bool)

(assert (=> b!94549 m!138145))

(declare-fun m!138147 () Bool)

(assert (=> b!94546 m!138147))

(declare-fun m!138149 () Bool)

(assert (=> b!94555 m!138149))

(declare-fun m!138151 () Bool)

(assert (=> b!94548 m!138151))

(check-sat (not b!94556) (not b!94546) (not b!94552) (not b!94548) (not b!94544) (not b!94550) (not b!94545) (not b!94543) (not b!94555) (not b!94549) (not b!94547) (not b!94554) (not start!18952) (not b!94551) (not b!94541))
