; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15898 () Bool)

(assert start!15898)

(declare-fun res!66412 () Bool)

(declare-fun e!52776 () Bool)

(assert (=> start!15898 (=> (not res!66412) (not e!52776))))

(declare-fun nBits!516 () (_ BitVec 64))

(assert (=> start!15898 (= res!66412 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!516) (bvsle nBits!516 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15898 e!52776))

(assert (=> start!15898 true))

(declare-datatypes ((array!3510 0))(
  ( (array!3511 (arr!2227 (Array (_ BitVec 32) (_ BitVec 8))) (size!1620 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2802 0))(
  ( (BitStream!2803 (buf!2010 array!3510) (currentByte!3902 (_ BitVec 32)) (currentBit!3897 (_ BitVec 32))) )
))
(declare-fun thiss!1716 () BitStream!2802)

(declare-fun e!52775 () Bool)

(declare-fun inv!12 (BitStream!2802) Bool)

(assert (=> start!15898 (and (inv!12 thiss!1716) e!52775)))

(declare-fun b!80269 () Bool)

(declare-fun res!66411 () Bool)

(assert (=> b!80269 (=> (not res!66411) (not e!52776))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!80269 (= res!66411 (validate_offset_bits!1 ((_ sign_extend 32) (size!1620 (buf!2010 thiss!1716))) ((_ sign_extend 32) (currentByte!3902 thiss!1716)) ((_ sign_extend 32) (currentBit!3897 thiss!1716)) nBits!516))))

(declare-fun b!80270 () Bool)

(assert (=> b!80270 (= e!52776 (bvslt ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 nBits!516) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000))))

(declare-fun b!80271 () Bool)

(declare-fun array_inv!1466 (array!3510) Bool)

(assert (=> b!80271 (= e!52775 (array_inv!1466 (buf!2010 thiss!1716)))))

(assert (= (and start!15898 res!66412) b!80269))

(assert (= (and b!80269 res!66411) b!80270))

(assert (= start!15898 b!80271))

(declare-fun m!125739 () Bool)

(assert (=> start!15898 m!125739))

(declare-fun m!125741 () Bool)

(assert (=> b!80269 m!125741))

(declare-fun m!125743 () Bool)

(assert (=> b!80271 m!125743))

(check-sat (not start!15898) (not b!80269) (not b!80271))
(check-sat)
