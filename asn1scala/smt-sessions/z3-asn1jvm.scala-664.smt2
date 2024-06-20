; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18668 () Bool)

(assert start!18668)

(declare-fun b!92701 () Bool)

(declare-fun res!76520 () Bool)

(declare-fun e!60913 () Bool)

(assert (=> b!92701 (=> (not res!76520) (not e!60913))))

(declare-datatypes ((array!4340 0))(
  ( (array!4341 (arr!2587 (Array (_ BitVec 32) (_ BitVec 8))) (size!1964 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3462 0))(
  ( (BitStream!3463 (buf!2340 array!4340) (currentByte!4665 (_ BitVec 32)) (currentBit!4660 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3462)

(declare-fun bitStream2!8 () BitStream!3462)

(declare-fun base!8 () BitStream!3462)

(assert (=> b!92701 (= res!76520 (and (= (buf!2340 bitStream1!8) (buf!2340 bitStream2!8)) (= (buf!2340 bitStream1!8) (buf!2340 base!8))))))

(declare-fun b!92702 () Bool)

(declare-fun res!76522 () Bool)

(assert (=> b!92702 (=> (not res!76522) (not e!60913))))

(declare-fun isPrefixOf!0 (BitStream!3462 BitStream!3462) Bool)

(assert (=> b!92702 (= res!76522 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92703 () Bool)

(declare-fun e!60912 () Bool)

(declare-fun array_inv!1796 (array!4340) Bool)

(assert (=> b!92703 (= e!60912 (array_inv!1796 (buf!2340 bitStream2!8)))))

(declare-fun res!76524 () Bool)

(assert (=> start!18668 (=> (not res!76524) (not e!60913))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18668 (= res!76524 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18668 e!60913))

(assert (=> start!18668 true))

(declare-fun e!60914 () Bool)

(declare-fun inv!12 (BitStream!3462) Bool)

(assert (=> start!18668 (and (inv!12 bitStream1!8) e!60914)))

(assert (=> start!18668 (and (inv!12 bitStream2!8) e!60912)))

(declare-fun e!60917 () Bool)

(assert (=> start!18668 (and (inv!12 base!8) e!60917)))

(declare-fun b!92704 () Bool)

(declare-fun res!76521 () Bool)

(assert (=> b!92704 (=> (not res!76521) (not e!60913))))

(assert (=> b!92704 (= res!76521 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92705 () Bool)

(declare-fun res!76519 () Bool)

(assert (=> b!92705 (=> (not res!76519) (not e!60913))))

(assert (=> b!92705 (= res!76519 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92706 () Bool)

(assert (=> b!92706 (= e!60913 (or (bvsgt ((_ sign_extend 32) (size!1964 (buf!2340 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4665 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4660 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!92707 () Bool)

(assert (=> b!92707 (= e!60914 (array_inv!1796 (buf!2340 bitStream1!8)))))

(declare-fun b!92708 () Bool)

(declare-fun res!76526 () Bool)

(assert (=> b!92708 (=> (not res!76526) (not e!60913))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92708 (= res!76526 (bvslt (bitIndex!0 (size!1964 (buf!2340 base!8)) (currentByte!4665 base!8) (currentBit!4660 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92709 () Bool)

(declare-fun res!76523 () Bool)

(assert (=> b!92709 (=> (not res!76523) (not e!60913))))

(assert (=> b!92709 (= res!76523 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1964 (buf!2340 bitStream1!8)) (currentByte!4665 bitStream1!8) (currentBit!4660 bitStream1!8))) (bitIndex!0 (size!1964 (buf!2340 bitStream2!8)) (currentByte!4665 bitStream2!8) (currentBit!4660 bitStream2!8))))))

(declare-fun b!92710 () Bool)

(declare-fun res!76525 () Bool)

(assert (=> b!92710 (=> (not res!76525) (not e!60913))))

(declare-datatypes ((List!837 0))(
  ( (Nil!834) (Cons!833 (h!952 Bool) (t!1587 List!837)) )
))
(declare-fun listBits!13 () List!837)

(declare-fun length!428 (List!837) Int)

(assert (=> b!92710 (= res!76525 (> (length!428 listBits!13) 0))))

(declare-fun b!92711 () Bool)

(assert (=> b!92711 (= e!60917 (array_inv!1796 (buf!2340 base!8)))))

(declare-fun b!92712 () Bool)

(declare-fun res!76518 () Bool)

(assert (=> b!92712 (=> (not res!76518) (not e!60913))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92712 (= res!76518 (validate_offset_bits!1 ((_ sign_extend 32) (size!1964 (buf!2340 bitStream1!8))) ((_ sign_extend 32) (currentByte!4665 bitStream1!8)) ((_ sign_extend 32) (currentBit!4660 bitStream1!8)) nBits!484))))

(assert (= (and start!18668 res!76524) b!92710))

(assert (= (and b!92710 res!76525) b!92704))

(assert (= (and b!92704 res!76521) b!92705))

(assert (= (and b!92705 res!76519) b!92702))

(assert (= (and b!92702 res!76522) b!92701))

(assert (= (and b!92701 res!76520) b!92708))

(assert (= (and b!92708 res!76526) b!92709))

(assert (= (and b!92709 res!76523) b!92712))

(assert (= (and b!92712 res!76518) b!92706))

(assert (= start!18668 b!92707))

(assert (= start!18668 b!92703))

(assert (= start!18668 b!92711))

(declare-fun m!136617 () Bool)

(assert (=> b!92712 m!136617))

(declare-fun m!136619 () Bool)

(assert (=> b!92708 m!136619))

(declare-fun m!136621 () Bool)

(assert (=> b!92707 m!136621))

(declare-fun m!136623 () Bool)

(assert (=> b!92703 m!136623))

(declare-fun m!136625 () Bool)

(assert (=> b!92705 m!136625))

(declare-fun m!136627 () Bool)

(assert (=> b!92702 m!136627))

(declare-fun m!136629 () Bool)

(assert (=> b!92710 m!136629))

(declare-fun m!136631 () Bool)

(assert (=> start!18668 m!136631))

(declare-fun m!136633 () Bool)

(assert (=> start!18668 m!136633))

(declare-fun m!136635 () Bool)

(assert (=> start!18668 m!136635))

(declare-fun m!136637 () Bool)

(assert (=> b!92709 m!136637))

(declare-fun m!136639 () Bool)

(assert (=> b!92709 m!136639))

(declare-fun m!136641 () Bool)

(assert (=> b!92704 m!136641))

(declare-fun m!136643 () Bool)

(assert (=> b!92711 m!136643))

(check-sat (not b!92712) (not b!92708) (not b!92702) (not b!92704) (not b!92710) (not b!92711) (not b!92705) (not b!92703) (not b!92707) (not b!92709) (not start!18668))
(check-sat)
