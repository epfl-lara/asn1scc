; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25368 () Bool)

(assert start!25368)

(declare-fun b!128040 () Bool)

(declare-fun res!105950 () Bool)

(declare-fun e!84905 () Bool)

(assert (=> b!128040 (=> (not res!105950) (not e!84905))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128040 (= res!105950 (bvslt from!447 to!404))))

(declare-fun b!128041 () Bool)

(declare-datatypes ((array!5904 0))(
  ( (array!5905 (arr!3286 (Array (_ BitVec 32) (_ BitVec 8))) (size!2669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4602 0))(
  ( (BitStream!4603 (buf!3027 array!5904) (currentByte!5779 (_ BitVec 32)) (currentBit!5774 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4602)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128041 (= e!84905 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5774 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5779 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2669 (buf!3027 thiss!1634)))))))))

(declare-fun b!128043 () Bool)

(declare-fun res!105948 () Bool)

(assert (=> b!128043 (=> (not res!105948) (not e!84905))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128043 (= res!105948 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2669 (buf!3027 thiss!1634))) ((_ sign_extend 32) (currentByte!5779 thiss!1634)) ((_ sign_extend 32) (currentBit!5774 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128044 () Bool)

(declare-fun e!84906 () Bool)

(declare-fun array_inv!2458 (array!5904) Bool)

(assert (=> b!128044 (= e!84906 (array_inv!2458 (buf!3027 thiss!1634)))))

(declare-fun b!128045 () Bool)

(declare-fun res!105951 () Bool)

(assert (=> b!128045 (=> (not res!105951) (not e!84905))))

(assert (=> b!128045 (= res!105951 (invariant!0 (currentBit!5774 thiss!1634) (currentByte!5779 thiss!1634) (size!2669 (buf!3027 thiss!1634))))))

(declare-fun res!105952 () Bool)

(assert (=> start!25368 (=> (not res!105952) (not e!84905))))

(declare-fun arr!237 () array!5904)

(assert (=> start!25368 (= res!105952 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2669 arr!237))))))

(assert (=> start!25368 e!84905))

(assert (=> start!25368 true))

(assert (=> start!25368 (array_inv!2458 arr!237)))

(declare-fun inv!12 (BitStream!4602) Bool)

(assert (=> start!25368 (and (inv!12 thiss!1634) e!84906)))

(declare-fun b!128042 () Bool)

(declare-fun res!105949 () Bool)

(assert (=> b!128042 (=> (not res!105949) (not e!84905))))

(assert (=> b!128042 (= res!105949 (and (bvsle ((_ sign_extend 32) (size!2669 (buf!3027 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5779 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5774 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2669 (buf!3027 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!5779 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!5774 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!25368 res!105952) b!128043))

(assert (= (and b!128043 res!105948) b!128040))

(assert (= (and b!128040 res!105950) b!128045))

(assert (= (and b!128045 res!105951) b!128042))

(assert (= (and b!128042 res!105949) b!128041))

(assert (= start!25368 b!128044))

(declare-fun m!193819 () Bool)

(assert (=> b!128041 m!193819))

(declare-fun m!193821 () Bool)

(assert (=> start!25368 m!193821))

(declare-fun m!193823 () Bool)

(assert (=> start!25368 m!193823))

(declare-fun m!193825 () Bool)

(assert (=> b!128045 m!193825))

(declare-fun m!193827 () Bool)

(assert (=> b!128044 m!193827))

(declare-fun m!193829 () Bool)

(assert (=> b!128043 m!193829))

(check-sat (not b!128044) (not b!128041) (not start!25368) (not b!128043) (not b!128045))
