; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55176 () Bool)

(assert start!55176)

(declare-fun res!215855 () Bool)

(declare-fun e!178618 () Bool)

(assert (=> start!55176 (=> (not res!215855) (not e!178618))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55176 (= res!215855 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55176 e!178618))

(assert (=> start!55176 true))

(declare-datatypes ((array!14012 0))(
  ( (array!14013 (arr!7133 (Array (_ BitVec 32) (_ BitVec 8))) (size!6146 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11214 0))(
  ( (BitStream!11215 (buf!6668 array!14012) (currentByte!12213 (_ BitVec 32)) (currentBit!12208 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11214)

(declare-fun e!178615 () Bool)

(declare-fun inv!12 (BitStream!11214) Bool)

(assert (=> start!55176 (and (inv!12 thiss!1754) e!178615)))

(declare-fun b!257564 () Bool)

(declare-datatypes ((tuple2!22042 0))(
  ( (tuple2!22043 (_1!11957 Bool) (_2!11957 BitStream!11214)) )
))
(declare-fun lt!398773 () tuple2!22042)

(declare-fun e!178614 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257564 (= e!178614 (validate_offset_bits!1 ((_ sign_extend 32) (size!6146 (buf!6668 (_2!11957 lt!398773)))) ((_ sign_extend 32) (currentByte!12213 (_2!11957 lt!398773))) ((_ sign_extend 32) (currentBit!12208 (_2!11957 lt!398773))) (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))))))

(declare-fun b!257565 () Bool)

(declare-fun res!215853 () Bool)

(assert (=> b!257565 (=> (not res!215853) (not e!178618))))

(assert (=> b!257565 (= res!215853 (validate_offset_bits!1 ((_ sign_extend 32) (size!6146 (buf!6668 thiss!1754))) ((_ sign_extend 32) (currentByte!12213 thiss!1754)) ((_ sign_extend 32) (currentBit!12208 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257566 () Bool)

(declare-fun e!178616 () Bool)

(assert (=> b!257566 (= e!178616 (not e!178614))))

(declare-fun res!215857 () Bool)

(assert (=> b!257566 (=> res!215857 e!178614)))

(assert (=> b!257566 (= res!215857 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(assert (=> b!257566 (validate_offset_bits!1 ((_ sign_extend 32) (size!6146 (buf!6668 (_2!11957 lt!398773)))) ((_ sign_extend 32) (currentByte!12213 (_2!11957 lt!398773))) ((_ sign_extend 32) (currentBit!12208 (_2!11957 lt!398773))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18395 0))(
  ( (Unit!18396) )
))
(declare-fun lt!398774 () Unit!18395)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11214 BitStream!11214 (_ BitVec 64) (_ BitVec 64)) Unit!18395)

(assert (=> b!257566 (= lt!398774 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11957 lt!398773) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!257567 () Bool)

(assert (=> b!257567 (= e!178618 e!178616)))

(declare-fun res!215856 () Bool)

(assert (=> b!257567 (=> (not res!215856) (not e!178616))))

(declare-fun expected!109 () Bool)

(assert (=> b!257567 (= res!215856 (= (_1!11957 lt!398773) expected!109))))

(declare-fun readBit!0 (BitStream!11214) tuple2!22042)

(assert (=> b!257567 (= lt!398773 (readBit!0 thiss!1754))))

(declare-fun b!257568 () Bool)

(declare-fun array_inv!5887 (array!14012) Bool)

(assert (=> b!257568 (= e!178615 (array_inv!5887 (buf!6668 thiss!1754)))))

(declare-fun b!257569 () Bool)

(declare-fun res!215854 () Bool)

(assert (=> b!257569 (=> (not res!215854) (not e!178618))))

(assert (=> b!257569 (= res!215854 (not (= from!526 nBits!535)))))

(assert (= (and start!55176 res!215855) b!257565))

(assert (= (and b!257565 res!215853) b!257569))

(assert (= (and b!257569 res!215854) b!257567))

(assert (= (and b!257567 res!215856) b!257566))

(assert (= (and b!257566 (not res!215857)) b!257564))

(assert (= start!55176 b!257568))

(declare-fun m!387043 () Bool)

(assert (=> b!257564 m!387043))

(declare-fun m!387045 () Bool)

(assert (=> b!257565 m!387045))

(declare-fun m!387047 () Bool)

(assert (=> b!257567 m!387047))

(declare-fun m!387049 () Bool)

(assert (=> b!257568 m!387049))

(declare-fun m!387051 () Bool)

(assert (=> b!257566 m!387051))

(declare-fun m!387053 () Bool)

(assert (=> b!257566 m!387053))

(declare-fun m!387055 () Bool)

(assert (=> start!55176 m!387055))

(check-sat (not b!257567) (not b!257564) (not b!257568) (not start!55176) (not b!257565) (not b!257566))
(check-sat)
