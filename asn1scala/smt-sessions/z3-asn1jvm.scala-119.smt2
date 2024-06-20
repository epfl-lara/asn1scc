; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2776 () Bool)

(assert start!2776)

(declare-fun res!12469 () Bool)

(declare-fun e!8007 () Bool)

(assert (=> start!2776 (=> (not res!12469) (not e!8007))))

(declare-datatypes ((array!734 0))(
  ( (array!735 (arr!749 (Array (_ BitVec 32) (_ BitVec 8))) (size!320 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!600 0))(
  ( (BitStream!601 (buf!671 array!734) (currentByte!1758 (_ BitVec 32)) (currentBit!1753 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!600)

(assert (=> start!2776 (= res!12469 (and (bvsle ((_ sign_extend 32) (size!320 (buf!671 thiss!957))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1758 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1753 thiss!957)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!320 (buf!671 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1758 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1753 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!2776 e!8007))

(declare-fun e!8008 () Bool)

(declare-fun inv!12 (BitStream!600) Bool)

(assert (=> start!2776 (and (inv!12 thiss!957) e!8008)))

(declare-fun b!13139 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13139 (= e!8007 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1753 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1758 thiss!957))) ((_ extract 31 0) ((_ sign_extend 32) (size!320 (buf!671 thiss!957)))))))))

(declare-fun b!13140 () Bool)

(declare-fun array_inv!309 (array!734) Bool)

(assert (=> b!13140 (= e!8008 (array_inv!309 (buf!671 thiss!957)))))

(assert (= (and start!2776 res!12469) b!13139))

(assert (= start!2776 b!13140))

(declare-fun m!19799 () Bool)

(assert (=> start!2776 m!19799))

(declare-fun m!19801 () Bool)

(assert (=> b!13139 m!19801))

(declare-fun m!19803 () Bool)

(assert (=> b!13140 m!19803))

(check-sat (not b!13140) (not b!13139) (not start!2776))
(check-sat)
(get-model)

