; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25370 () Bool)

(assert start!25370)

(declare-fun b!128058 () Bool)

(declare-fun res!105965 () Bool)

(declare-fun e!84920 () Bool)

(assert (=> b!128058 (=> (not res!105965) (not e!84920))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128058 (= res!105965 (bvslt from!447 to!404))))

(declare-fun b!128059 () Bool)

(declare-fun e!84919 () Bool)

(declare-datatypes ((array!5906 0))(
  ( (array!5907 (arr!3287 (Array (_ BitVec 32) (_ BitVec 8))) (size!2670 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4604 0))(
  ( (BitStream!4605 (buf!3028 array!5906) (currentByte!5780 (_ BitVec 32)) (currentBit!5775 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4604)

(declare-fun array_inv!2459 (array!5906) Bool)

(assert (=> b!128059 (= e!84919 (array_inv!2459 (buf!3028 thiss!1634)))))

(declare-fun b!128060 () Bool)

(declare-fun res!105967 () Bool)

(assert (=> b!128060 (=> (not res!105967) (not e!84920))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128060 (= res!105967 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2670 (buf!3028 thiss!1634))) ((_ sign_extend 32) (currentByte!5780 thiss!1634)) ((_ sign_extend 32) (currentBit!5775 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128061 () Bool)

(declare-fun res!105966 () Bool)

(assert (=> b!128061 (=> (not res!105966) (not e!84920))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128061 (= res!105966 (invariant!0 (currentBit!5775 thiss!1634) (currentByte!5780 thiss!1634) (size!2670 (buf!3028 thiss!1634))))))

(declare-fun b!128062 () Bool)

(assert (=> b!128062 (= e!84920 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5775 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5780 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2670 (buf!3028 thiss!1634)))))))))

(declare-fun b!128063 () Bool)

(declare-fun res!105964 () Bool)

(assert (=> b!128063 (=> (not res!105964) (not e!84920))))

(assert (=> b!128063 (= res!105964 (and (bvsle ((_ sign_extend 32) (size!2670 (buf!3028 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5780 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5775 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2670 (buf!3028 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5780 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5775 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!105963 () Bool)

(assert (=> start!25370 (=> (not res!105963) (not e!84920))))

(declare-fun arr!237 () array!5906)

(assert (=> start!25370 (= res!105963 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2670 arr!237))))))

(assert (=> start!25370 e!84920))

(assert (=> start!25370 true))

(assert (=> start!25370 (array_inv!2459 arr!237)))

(declare-fun inv!12 (BitStream!4604) Bool)

(assert (=> start!25370 (and (inv!12 thiss!1634) e!84919)))

(assert (= (and start!25370 res!105963) b!128060))

(assert (= (and b!128060 res!105967) b!128058))

(assert (= (and b!128058 res!105965) b!128061))

(assert (= (and b!128061 res!105966) b!128063))

(assert (= (and b!128063 res!105964) b!128062))

(assert (= start!25370 b!128059))

(declare-fun m!193831 () Bool)

(assert (=> b!128061 m!193831))

(declare-fun m!193833 () Bool)

(assert (=> b!128060 m!193833))

(declare-fun m!193835 () Bool)

(assert (=> b!128062 m!193835))

(declare-fun m!193837 () Bool)

(assert (=> start!25370 m!193837))

(declare-fun m!193839 () Bool)

(assert (=> start!25370 m!193839))

(declare-fun m!193841 () Bool)

(assert (=> b!128059 m!193841))

(push 1)

(assert (not b!128060))

(assert (not b!128062))

(assert (not b!128059))

(assert (not start!25370))

(assert (not b!128061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

