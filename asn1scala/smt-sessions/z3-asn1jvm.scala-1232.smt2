; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34990 () Bool)

(assert start!34990)

(declare-fun res!137369 () Bool)

(declare-fun e!113983 () Bool)

(assert (=> start!34990 (=> (not res!137369) (not e!113983))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34990 (= res!137369 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34990 e!113983))

(assert (=> start!34990 true))

(declare-datatypes ((array!8297 0))(
  ( (array!8298 (arr!4631 (Array (_ BitVec 32) (_ BitVec 8))) (size!3710 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6576 0))(
  ( (BitStream!6577 (buf!4162 array!8297) (currentByte!7772 (_ BitVec 32)) (currentBit!7767 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6576)

(declare-fun e!113985 () Bool)

(declare-fun inv!12 (BitStream!6576) Bool)

(assert (=> start!34990 (and (inv!12 thiss!1577) e!113985)))

(declare-fun b!164866 () Bool)

(declare-fun res!137368 () Bool)

(assert (=> b!164866 (=> (not res!137368) (not e!113983))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164866 (= res!137368 (validate_offset_bits!1 ((_ sign_extend 32) (size!3710 (buf!4162 thiss!1577))) ((_ sign_extend 32) (currentByte!7772 thiss!1577)) ((_ sign_extend 32) (currentBit!7767 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164867 () Bool)

(declare-fun lt!258513 () (_ BitVec 32))

(assert (=> b!164867 (= e!113983 (and (bvslt lt!258513 #b00000000000000000000000010000000) (bvslt lt!258513 #b11111111111111111111111110000000)))))

(assert (=> b!164867 (= lt!258513 (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7767 thiss!1577))))))))

(declare-fun b!164868 () Bool)

(declare-fun array_inv!3451 (array!8297) Bool)

(assert (=> b!164868 (= e!113985 (array_inv!3451 (buf!4162 thiss!1577)))))

(assert (= (and start!34990 res!137369) b!164866))

(assert (= (and b!164866 res!137368) b!164867))

(assert (= start!34990 b!164868))

(declare-fun m!262227 () Bool)

(assert (=> start!34990 m!262227))

(declare-fun m!262229 () Bool)

(assert (=> b!164866 m!262229))

(declare-fun m!262231 () Bool)

(assert (=> b!164867 m!262231))

(declare-fun m!262233 () Bool)

(assert (=> b!164868 m!262233))

(check-sat (not start!34990) (not b!164866) (not b!164868))
(check-sat)
