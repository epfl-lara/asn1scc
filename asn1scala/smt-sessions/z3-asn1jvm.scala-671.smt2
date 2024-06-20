; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18796 () Bool)

(assert start!18796)

(declare-fun b!93658 () Bool)

(declare-fun res!77261 () Bool)

(declare-fun e!61511 () Bool)

(assert (=> b!93658 (=> (not res!77261) (not e!61511))))

(declare-datatypes ((array!4388 0))(
  ( (array!4389 (arr!2608 (Array (_ BitVec 32) (_ BitVec 8))) (size!1991 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3504 0))(
  ( (BitStream!3505 (buf!2361 array!4388) (currentByte!4703 (_ BitVec 32)) (currentBit!4698 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3504)

(declare-fun bitStream2!8 () BitStream!3504)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93658 (= res!77261 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1991 (buf!2361 bitStream1!8)) (currentByte!4703 bitStream1!8) (currentBit!4698 bitStream1!8))) (bitIndex!0 (size!1991 (buf!2361 bitStream2!8)) (currentByte!4703 bitStream2!8) (currentBit!4698 bitStream2!8))))))

(declare-fun b!93659 () Bool)

(declare-fun e!61506 () Bool)

(declare-fun base!8 () BitStream!3504)

(declare-fun array_inv!1817 (array!4388) Bool)

(assert (=> b!93659 (= e!61506 (array_inv!1817 (buf!2361 base!8)))))

(declare-fun b!93660 () Bool)

(declare-fun res!77259 () Bool)

(assert (=> b!93660 (=> (not res!77259) (not e!61511))))

(declare-fun isPrefixOf!0 (BitStream!3504 BitStream!3504) Bool)

(assert (=> b!93660 (= res!77259 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93661 () Bool)

(assert (=> b!93661 (= e!61511 false)))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-datatypes ((List!858 0))(
  ( (Nil!855) (Cons!854 (h!973 Bool) (t!1608 List!858)) )
))
(declare-fun lt!138477 () List!858)

(declare-fun thiss!1534 () BitStream!3504)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3504 BitStream!3504 (_ BitVec 64)) List!858)

(assert (=> b!93661 (= lt!138477 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484))))

(declare-fun b!93662 () Bool)

(declare-fun res!77265 () Bool)

(assert (=> b!93662 (=> (not res!77265) (not e!61511))))

(assert (=> b!93662 (= res!77265 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93663 () Bool)

(declare-fun res!77257 () Bool)

(assert (=> b!93663 (=> (not res!77257) (not e!61511))))

(assert (=> b!93663 (= res!77257 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93664 () Bool)

(declare-fun res!77256 () Bool)

(assert (=> b!93664 (=> (not res!77256) (not e!61511))))

(assert (=> b!93664 (= res!77256 (and (= (buf!2361 bitStream1!8) (buf!2361 bitStream2!8)) (= (buf!2361 bitStream1!8) (buf!2361 base!8))))))

(declare-fun b!93665 () Bool)

(declare-fun e!61512 () Bool)

(assert (=> b!93665 (= e!61512 (array_inv!1817 (buf!2361 thiss!1534)))))

(declare-fun b!93666 () Bool)

(declare-fun e!61504 () Bool)

(assert (=> b!93666 (= e!61504 (array_inv!1817 (buf!2361 bitStream2!8)))))

(declare-fun b!93668 () Bool)

(declare-fun e!61510 () Bool)

(assert (=> b!93668 (= e!61510 (array_inv!1817 (buf!2361 bitStream1!8)))))

(declare-fun b!93669 () Bool)

(declare-fun res!77260 () Bool)

(assert (=> b!93669 (=> (not res!77260) (not e!61511))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93669 (= res!77260 (validate_offset_bits!1 ((_ sign_extend 32) (size!1991 (buf!2361 bitStream2!8))) ((_ sign_extend 32) (currentByte!4703 bitStream2!8)) ((_ sign_extend 32) (currentBit!4698 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93670 () Bool)

(declare-fun res!77263 () Bool)

(assert (=> b!93670 (=> (not res!77263) (not e!61511))))

(assert (=> b!93670 (= res!77263 (bvslt (bitIndex!0 (size!1991 (buf!2361 base!8)) (currentByte!4703 base!8) (currentBit!4698 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93671 () Bool)

(declare-fun res!77264 () Bool)

(assert (=> b!93671 (=> (not res!77264) (not e!61511))))

(declare-fun listBits!13 () List!858)

(declare-fun length!449 (List!858) Int)

(assert (=> b!93671 (= res!77264 (> (length!449 listBits!13) 0))))

(declare-fun b!93667 () Bool)

(declare-fun res!77262 () Bool)

(assert (=> b!93667 (=> (not res!77262) (not e!61511))))

(assert (=> b!93667 (= res!77262 (validate_offset_bits!1 ((_ sign_extend 32) (size!1991 (buf!2361 bitStream1!8))) ((_ sign_extend 32) (currentByte!4703 bitStream1!8)) ((_ sign_extend 32) (currentBit!4698 bitStream1!8)) nBits!484))))

(declare-fun res!77258 () Bool)

(assert (=> start!18796 (=> (not res!77258) (not e!61511))))

(assert (=> start!18796 (= res!77258 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18796 e!61511))

(assert (=> start!18796 true))

(declare-fun inv!12 (BitStream!3504) Bool)

(assert (=> start!18796 (and (inv!12 bitStream1!8) e!61510)))

(assert (=> start!18796 (and (inv!12 bitStream2!8) e!61504)))

(assert (=> start!18796 (and (inv!12 base!8) e!61506)))

(assert (=> start!18796 (and (inv!12 thiss!1534) e!61512)))

(assert (= (and start!18796 res!77258) b!93671))

(assert (= (and b!93671 res!77264) b!93662))

(assert (= (and b!93662 res!77265) b!93660))

(assert (= (and b!93660 res!77259) b!93663))

(assert (= (and b!93663 res!77257) b!93664))

(assert (= (and b!93664 res!77256) b!93670))

(assert (= (and b!93670 res!77263) b!93658))

(assert (= (and b!93658 res!77261) b!93667))

(assert (= (and b!93667 res!77262) b!93669))

(assert (= (and b!93669 res!77260) b!93661))

(assert (= start!18796 b!93668))

(assert (= start!18796 b!93666))

(assert (= start!18796 b!93659))

(assert (= start!18796 b!93665))

(declare-fun m!137405 () Bool)

(assert (=> b!93660 m!137405))

(declare-fun m!137407 () Bool)

(assert (=> b!93659 m!137407))

(declare-fun m!137409 () Bool)

(assert (=> b!93671 m!137409))

(declare-fun m!137411 () Bool)

(assert (=> b!93667 m!137411))

(declare-fun m!137413 () Bool)

(assert (=> b!93663 m!137413))

(declare-fun m!137415 () Bool)

(assert (=> b!93669 m!137415))

(declare-fun m!137417 () Bool)

(assert (=> b!93670 m!137417))

(declare-fun m!137419 () Bool)

(assert (=> b!93662 m!137419))

(declare-fun m!137421 () Bool)

(assert (=> b!93668 m!137421))

(declare-fun m!137423 () Bool)

(assert (=> b!93658 m!137423))

(declare-fun m!137425 () Bool)

(assert (=> b!93658 m!137425))

(declare-fun m!137427 () Bool)

(assert (=> b!93661 m!137427))

(declare-fun m!137429 () Bool)

(assert (=> b!93665 m!137429))

(declare-fun m!137431 () Bool)

(assert (=> b!93666 m!137431))

(declare-fun m!137433 () Bool)

(assert (=> start!18796 m!137433))

(declare-fun m!137435 () Bool)

(assert (=> start!18796 m!137435))

(declare-fun m!137437 () Bool)

(assert (=> start!18796 m!137437))

(declare-fun m!137439 () Bool)

(assert (=> start!18796 m!137439))

(check-sat (not b!93658) (not b!93663) (not b!93666) (not b!93670) (not b!93669) (not b!93665) (not b!93661) (not b!93668) (not start!18796) (not b!93667) (not b!93660) (not b!93662) (not b!93671) (not b!93659))
