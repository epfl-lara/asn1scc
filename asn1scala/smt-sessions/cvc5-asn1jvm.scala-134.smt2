; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3206 () Bool)

(assert start!3206)

(declare-fun res!13673 () Bool)

(declare-fun e!8969 () Bool)

(assert (=> start!3206 (=> (not res!13673) (not e!8969))))

(declare-datatypes ((array!801 0))(
  ( (array!802 (arr!772 (Array (_ BitVec 32) (_ BitVec 8))) (size!343 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!646 0))(
  ( (BitStream!647 (buf!694 array!801) (currentByte!1832 (_ BitVec 32)) (currentBit!1827 (_ BitVec 32))) )
))
(declare-fun b!186 () BitStream!646)

(declare-fun thiss!913 () BitStream!646)

(assert (=> start!3206 (= res!13673 (= (size!343 (buf!694 b!186)) (size!343 (buf!694 thiss!913))))))

(assert (=> start!3206 e!8969))

(declare-fun e!8967 () Bool)

(declare-fun inv!12 (BitStream!646) Bool)

(assert (=> start!3206 (and (inv!12 b!186) e!8967)))

(declare-fun e!8968 () Bool)

(assert (=> start!3206 (and (inv!12 thiss!913) e!8968)))

(declare-fun b!14532 () Bool)

(assert (=> b!14532 (= e!8969 (not (inv!12 (BitStream!647 (buf!694 thiss!913) (currentByte!1832 b!186) (currentBit!1827 b!186)))))))

(declare-fun b!14533 () Bool)

(declare-fun array_inv!332 (array!801) Bool)

(assert (=> b!14533 (= e!8967 (array_inv!332 (buf!694 b!186)))))

(declare-fun b!14534 () Bool)

(assert (=> b!14534 (= e!8968 (array_inv!332 (buf!694 thiss!913)))))

(assert (= (and start!3206 res!13673) b!14532))

(assert (= start!3206 b!14533))

(assert (= start!3206 b!14534))

(declare-fun m!20921 () Bool)

(assert (=> start!3206 m!20921))

(declare-fun m!20923 () Bool)

(assert (=> start!3206 m!20923))

(declare-fun m!20925 () Bool)

(assert (=> b!14532 m!20925))

(declare-fun m!20927 () Bool)

(assert (=> b!14533 m!20927))

(declare-fun m!20929 () Bool)

(assert (=> b!14534 m!20929))

(push 1)

(assert (not b!14533))

(assert (not start!3206))

(assert (not b!14534))

(assert (not b!14532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4714 () Bool)

(assert (=> d!4714 (= (array_inv!332 (buf!694 b!186)) (bvsge (size!343 (buf!694 b!186)) #b00000000000000000000000000000000))))

(assert (=> b!14533 d!4714))

(declare-fun d!4716 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4716 (= (inv!12 b!186) (invariant!0 (currentBit!1827 b!186) (currentByte!1832 b!186) (size!343 (buf!694 b!186))))))

(declare-fun bs!1293 () Bool)

(assert (= bs!1293 d!4716))

(declare-fun m!20955 () Bool)

(assert (=> bs!1293 m!20955))

(assert (=> start!3206 d!4716))

(declare-fun d!4722 () Bool)

(assert (=> d!4722 (= (inv!12 thiss!913) (invariant!0 (currentBit!1827 thiss!913) (currentByte!1832 thiss!913) (size!343 (buf!694 thiss!913))))))

(declare-fun bs!1294 () Bool)

(assert (= bs!1294 d!4722))

(declare-fun m!20957 () Bool)

(assert (=> bs!1294 m!20957))

(assert (=> start!3206 d!4722))

(declare-fun d!4728 () Bool)

(assert (=> d!4728 (= (array_inv!332 (buf!694 thiss!913)) (bvsge (size!343 (buf!694 thiss!913)) #b00000000000000000000000000000000))))

(assert (=> b!14534 d!4728))

(declare-fun d!4732 () Bool)

(assert (=> d!4732 (= (inv!12 (BitStream!647 (buf!694 thiss!913) (currentByte!1832 b!186) (currentBit!1827 b!186))) (invariant!0 (currentBit!1827 (BitStream!647 (buf!694 thiss!913) (currentByte!1832 b!186) (currentBit!1827 b!186))) (currentByte!1832 (BitStream!647 (buf!694 thiss!913) (currentByte!1832 b!186) (currentBit!1827 b!186))) (size!343 (buf!694 (BitStream!647 (buf!694 thiss!913) (currentByte!1832 b!186) (currentBit!1827 b!186))))))))

(declare-fun bs!1297 () Bool)

(assert (= bs!1297 d!4732))

(declare-fun m!20963 () Bool)

(assert (=> bs!1297 m!20963))

(assert (=> b!14532 d!4732))

(push 1)

