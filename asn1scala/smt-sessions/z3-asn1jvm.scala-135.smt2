; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3226 () Bool)

(assert start!3226)

(declare-fun res!13685 () Bool)

(declare-fun e!9028 () Bool)

(assert (=> start!3226 (=> (not res!13685) (not e!9028))))

(declare-datatypes ((array!812 0))(
  ( (array!813 (arr!776 (Array (_ BitVec 32) (_ BitVec 8))) (size!347 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!654 0))(
  ( (BitStream!655 (buf!698 array!812) (currentByte!1836 (_ BitVec 32)) (currentBit!1831 (_ BitVec 32))) )
))
(declare-fun b!186 () BitStream!654)

(declare-fun thiss!913 () BitStream!654)

(assert (=> start!3226 (= res!13685 (= (size!347 (buf!698 b!186)) (size!347 (buf!698 thiss!913))))))

(assert (=> start!3226 e!9028))

(declare-fun e!9027 () Bool)

(declare-fun inv!12 (BitStream!654) Bool)

(assert (=> start!3226 (and (inv!12 b!186) e!9027)))

(declare-fun e!9029 () Bool)

(assert (=> start!3226 (and (inv!12 thiss!913) e!9029)))

(declare-fun b!14568 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!14568 (= e!9028 (not (invariant!0 (currentBit!1831 b!186) (currentByte!1836 b!186) (size!347 (buf!698 thiss!913)))))))

(declare-fun b!14569 () Bool)

(declare-fun array_inv!336 (array!812) Bool)

(assert (=> b!14569 (= e!9027 (array_inv!336 (buf!698 b!186)))))

(declare-fun b!14570 () Bool)

(assert (=> b!14570 (= e!9029 (array_inv!336 (buf!698 thiss!913)))))

(assert (= (and start!3226 res!13685) b!14568))

(assert (= start!3226 b!14569))

(assert (= start!3226 b!14570))

(declare-fun m!20979 () Bool)

(assert (=> start!3226 m!20979))

(declare-fun m!20981 () Bool)

(assert (=> start!3226 m!20981))

(declare-fun m!20983 () Bool)

(assert (=> b!14568 m!20983))

(declare-fun m!20985 () Bool)

(assert (=> b!14569 m!20985))

(declare-fun m!20987 () Bool)

(assert (=> b!14570 m!20987))

(check-sat (not b!14568) (not b!14569) (not start!3226) (not b!14570))
(check-sat)
(get-model)

