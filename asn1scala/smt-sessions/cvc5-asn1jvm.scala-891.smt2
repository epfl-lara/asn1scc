; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25366 () Bool)

(assert start!25366)

(declare-fun b!128022 () Bool)

(declare-fun e!84893 () Bool)

(declare-datatypes ((array!5902 0))(
  ( (array!5903 (arr!3285 (Array (_ BitVec 32) (_ BitVec 8))) (size!2668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4600 0))(
  ( (BitStream!4601 (buf!3026 array!5902) (currentByte!5778 (_ BitVec 32)) (currentBit!5773 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4600)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128022 (= e!84893 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5773 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5778 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2668 (buf!3026 thiss!1634)))))))))

(declare-fun res!105934 () Bool)

(assert (=> start!25366 (=> (not res!105934) (not e!84893))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5902)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25366 (= res!105934 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2668 arr!237))))))

(assert (=> start!25366 e!84893))

(assert (=> start!25366 true))

(declare-fun array_inv!2457 (array!5902) Bool)

(assert (=> start!25366 (array_inv!2457 arr!237)))

(declare-fun e!84895 () Bool)

(declare-fun inv!12 (BitStream!4600) Bool)

(assert (=> start!25366 (and (inv!12 thiss!1634) e!84895)))

(declare-fun b!128023 () Bool)

(declare-fun res!105933 () Bool)

(assert (=> b!128023 (=> (not res!105933) (not e!84893))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128023 (= res!105933 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2668 (buf!3026 thiss!1634))) ((_ sign_extend 32) (currentByte!5778 thiss!1634)) ((_ sign_extend 32) (currentBit!5773 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128024 () Bool)

(declare-fun res!105936 () Bool)

(assert (=> b!128024 (=> (not res!105936) (not e!84893))))

(assert (=> b!128024 (= res!105936 (and (bvsle ((_ sign_extend 32) (size!2668 (buf!3026 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5778 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5773 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2668 (buf!3026 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5778 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5773 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128025 () Bool)

(assert (=> b!128025 (= e!84895 (array_inv!2457 (buf!3026 thiss!1634)))))

(declare-fun b!128026 () Bool)

(declare-fun res!105937 () Bool)

(assert (=> b!128026 (=> (not res!105937) (not e!84893))))

(assert (=> b!128026 (= res!105937 (invariant!0 (currentBit!5773 thiss!1634) (currentByte!5778 thiss!1634) (size!2668 (buf!3026 thiss!1634))))))

(declare-fun b!128027 () Bool)

(declare-fun res!105935 () Bool)

(assert (=> b!128027 (=> (not res!105935) (not e!84893))))

(assert (=> b!128027 (= res!105935 (bvslt from!447 to!404))))

(assert (= (and start!25366 res!105934) b!128023))

(assert (= (and b!128023 res!105933) b!128027))

(assert (= (and b!128027 res!105935) b!128026))

(assert (= (and b!128026 res!105937) b!128024))

(assert (= (and b!128024 res!105936) b!128022))

(assert (= start!25366 b!128025))

(declare-fun m!193807 () Bool)

(assert (=> b!128026 m!193807))

(declare-fun m!193809 () Bool)

(assert (=> start!25366 m!193809))

(declare-fun m!193811 () Bool)

(assert (=> start!25366 m!193811))

(declare-fun m!193813 () Bool)

(assert (=> b!128025 m!193813))

(declare-fun m!193815 () Bool)

(assert (=> b!128022 m!193815))

(declare-fun m!193817 () Bool)

(assert (=> b!128023 m!193817))

(push 1)

(assert (not start!25366))

(assert (not b!128023))

(assert (not b!128022))

(assert (not b!128026))

(assert (not b!128025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

