; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3208 () Bool)

(assert start!3208)

(declare-fun res!13676 () Bool)

(declare-fun e!8983 () Bool)

(assert (=> start!3208 (=> (not res!13676) (not e!8983))))

(declare-datatypes ((array!803 0))(
  ( (array!804 (arr!773 (Array (_ BitVec 32) (_ BitVec 8))) (size!344 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!648 0))(
  ( (BitStream!649 (buf!695 array!803) (currentByte!1833 (_ BitVec 32)) (currentBit!1828 (_ BitVec 32))) )
))
(declare-fun b!186 () BitStream!648)

(declare-fun thiss!913 () BitStream!648)

(assert (=> start!3208 (= res!13676 (= (size!344 (buf!695 b!186)) (size!344 (buf!695 thiss!913))))))

(assert (=> start!3208 e!8983))

(declare-fun e!8985 () Bool)

(declare-fun inv!12 (BitStream!648) Bool)

(assert (=> start!3208 (and (inv!12 b!186) e!8985)))

(declare-fun e!8981 () Bool)

(assert (=> start!3208 (and (inv!12 thiss!913) e!8981)))

(declare-fun b!14541 () Bool)

(assert (=> b!14541 (= e!8983 (not (inv!12 (BitStream!649 (buf!695 thiss!913) (currentByte!1833 b!186) (currentBit!1828 b!186)))))))

(declare-fun b!14542 () Bool)

(declare-fun array_inv!333 (array!803) Bool)

(assert (=> b!14542 (= e!8985 (array_inv!333 (buf!695 b!186)))))

(declare-fun b!14543 () Bool)

(assert (=> b!14543 (= e!8981 (array_inv!333 (buf!695 thiss!913)))))

(assert (= (and start!3208 res!13676) b!14541))

(assert (= start!3208 b!14542))

(assert (= start!3208 b!14543))

(declare-fun m!20931 () Bool)

(assert (=> start!3208 m!20931))

(declare-fun m!20933 () Bool)

(assert (=> start!3208 m!20933))

(declare-fun m!20935 () Bool)

(assert (=> b!14541 m!20935))

(declare-fun m!20937 () Bool)

(assert (=> b!14542 m!20937))

(declare-fun m!20939 () Bool)

(assert (=> b!14543 m!20939))

(check-sat (not b!14541) (not b!14542) (not b!14543) (not start!3208))
(check-sat)
(get-model)

(declare-fun d!4712 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4712 (= (inv!12 (BitStream!649 (buf!695 thiss!913) (currentByte!1833 b!186) (currentBit!1828 b!186))) (invariant!0 (currentBit!1828 (BitStream!649 (buf!695 thiss!913) (currentByte!1833 b!186) (currentBit!1828 b!186))) (currentByte!1833 (BitStream!649 (buf!695 thiss!913) (currentByte!1833 b!186) (currentBit!1828 b!186))) (size!344 (buf!695 (BitStream!649 (buf!695 thiss!913) (currentByte!1833 b!186) (currentBit!1828 b!186))))))))

(declare-fun bs!1291 () Bool)

(assert (= bs!1291 d!4712))

(declare-fun m!20951 () Bool)

(assert (=> bs!1291 m!20951))

(assert (=> b!14541 d!4712))

(declare-fun d!4718 () Bool)

(assert (=> d!4718 (= (array_inv!333 (buf!695 b!186)) (bvsge (size!344 (buf!695 b!186)) #b00000000000000000000000000000000))))

(assert (=> b!14542 d!4718))

(declare-fun d!4725 () Bool)

(assert (=> d!4725 (= (array_inv!333 (buf!695 thiss!913)) (bvsge (size!344 (buf!695 thiss!913)) #b00000000000000000000000000000000))))

(assert (=> b!14543 d!4725))

(declare-fun d!4730 () Bool)

(assert (=> d!4730 (= (inv!12 b!186) (invariant!0 (currentBit!1828 b!186) (currentByte!1833 b!186) (size!344 (buf!695 b!186))))))

(declare-fun bs!1296 () Bool)

(assert (= bs!1296 d!4730))

(declare-fun m!20961 () Bool)

(assert (=> bs!1296 m!20961))

(assert (=> start!3208 d!4730))

(declare-fun d!4736 () Bool)

(assert (=> d!4736 (= (inv!12 thiss!913) (invariant!0 (currentBit!1828 thiss!913) (currentByte!1833 thiss!913) (size!344 (buf!695 thiss!913))))))

(declare-fun bs!1299 () Bool)

(assert (= bs!1299 d!4736))

(declare-fun m!20967 () Bool)

(assert (=> bs!1299 m!20967))

(assert (=> start!3208 d!4736))

(check-sat (not d!4712) (not d!4730) (not d!4736))
(check-sat)
