; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58226 () Bool)

(assert start!58226)

(declare-fun b!267417 () Bool)

(declare-fun e!187252 () Bool)

(declare-datatypes ((array!14884 0))(
  ( (array!14885 (arr!7475 (Array (_ BitVec 32) (_ BitVec 8))) (size!6488 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11790 0))(
  ( (BitStream!11791 (buf!6956 array!14884) (currentByte!12862 (_ BitVec 32)) (currentBit!12857 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11790)

(declare-fun array_inv!6212 (array!14884) Bool)

(assert (=> b!267417 (= e!187252 (array_inv!6212 (buf!6956 w1!591)))))

(declare-fun b!267418 () Bool)

(declare-fun e!187251 () Bool)

(declare-fun w2!587 () BitStream!11790)

(assert (=> b!267418 (= e!187251 (array_inv!6212 (buf!6956 w2!587)))))

(declare-fun res!223282 () Bool)

(declare-fun e!187253 () Bool)

(assert (=> start!58226 (=> (not res!223282) (not e!187253))))

(declare-fun isPrefixOf!0 (BitStream!11790 BitStream!11790) Bool)

(assert (=> start!58226 (= res!223282 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58226 e!187253))

(declare-fun inv!12 (BitStream!11790) Bool)

(assert (=> start!58226 (and (inv!12 w1!591) e!187252)))

(assert (=> start!58226 (and (inv!12 w2!587) e!187251)))

(declare-fun w3!25 () BitStream!11790)

(declare-fun e!187254 () Bool)

(assert (=> start!58226 (and (inv!12 w3!25) e!187254)))

(declare-fun b!267416 () Bool)

(assert (=> b!267416 (= e!187253 false)))

(declare-fun lt!407981 () Bool)

(assert (=> b!267416 (= lt!407981 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267419 () Bool)

(assert (=> b!267419 (= e!187254 (array_inv!6212 (buf!6956 w3!25)))))

(assert (= (and start!58226 res!223282) b!267416))

(assert (= start!58226 b!267417))

(assert (= start!58226 b!267418))

(assert (= start!58226 b!267419))

(declare-fun m!398601 () Bool)

(assert (=> b!267416 m!398601))

(declare-fun m!398603 () Bool)

(assert (=> b!267419 m!398603))

(declare-fun m!398605 () Bool)

(assert (=> b!267418 m!398605))

(declare-fun m!398607 () Bool)

(assert (=> start!58226 m!398607))

(declare-fun m!398609 () Bool)

(assert (=> start!58226 m!398609))

(declare-fun m!398611 () Bool)

(assert (=> start!58226 m!398611))

(declare-fun m!398613 () Bool)

(assert (=> start!58226 m!398613))

(declare-fun m!398615 () Bool)

(assert (=> b!267417 m!398615))

(check-sat (not start!58226) (not b!267416) (not b!267418) (not b!267417) (not b!267419))
