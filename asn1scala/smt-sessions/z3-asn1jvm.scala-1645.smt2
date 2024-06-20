; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46050 () Bool)

(assert start!46050)

(declare-datatypes ((array!10806 0))(
  ( (array!10807 (arr!5675 (Array (_ BitVec 32) (_ BitVec 8))) (size!4745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8598 0))(
  ( (BitStream!8599 (buf!5292 array!10806) (currentByte!9943 (_ BitVec 32)) (currentBit!9938 (_ BitVec 32))) )
))
(declare-fun thiss!1933 () BitStream!8598)

(assert (=> start!46050 (or (bvsgt ((_ sign_extend 32) (size!4745 (buf!5292 thiss!1933))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!9943 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!9938 thiss!1933)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!151054 () Bool)

(declare-fun inv!12 (BitStream!8598) Bool)

(assert (=> start!46050 (and (inv!12 thiss!1933) e!151054)))

(declare-fun b!222423 () Bool)

(declare-fun array_inv!4486 (array!10806) Bool)

(assert (=> b!222423 (= e!151054 (array_inv!4486 (buf!5292 thiss!1933)))))

(assert (= start!46050 b!222423))

(declare-fun m!340645 () Bool)

(assert (=> start!46050 m!340645))

(declare-fun m!340647 () Bool)

(assert (=> b!222423 m!340647))

(check-sat (not start!46050) (not b!222423))
(check-sat)
