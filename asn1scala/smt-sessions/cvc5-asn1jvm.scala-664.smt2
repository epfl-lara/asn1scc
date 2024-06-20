; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18666 () Bool)

(assert start!18666)

(declare-fun b!92665 () Bool)

(declare-fun res!76492 () Bool)

(declare-fun e!60891 () Bool)

(assert (=> b!92665 (=> (not res!76492) (not e!60891))))

(declare-datatypes ((array!4338 0))(
  ( (array!4339 (arr!2586 (Array (_ BitVec 32) (_ BitVec 8))) (size!1963 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3460 0))(
  ( (BitStream!3461 (buf!2339 array!4338) (currentByte!4664 (_ BitVec 32)) (currentBit!4659 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3460)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92665 (= res!76492 (bvslt (bitIndex!0 (size!1963 (buf!2339 base!8)) (currentByte!4664 base!8) (currentBit!4659 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92666 () Bool)

(declare-fun res!76493 () Bool)

(assert (=> b!92666 (=> (not res!76493) (not e!60891))))

(declare-fun bitStream1!8 () BitStream!3460)

(declare-fun bitStream2!8 () BitStream!3460)

(declare-fun isPrefixOf!0 (BitStream!3460 BitStream!3460) Bool)

(assert (=> b!92666 (= res!76493 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92667 () Bool)

(declare-fun res!76498 () Bool)

(assert (=> b!92667 (=> (not res!76498) (not e!60891))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92667 (= res!76498 (validate_offset_bits!1 ((_ sign_extend 32) (size!1963 (buf!2339 bitStream1!8))) ((_ sign_extend 32) (currentByte!4664 bitStream1!8)) ((_ sign_extend 32) (currentBit!4659 bitStream1!8)) nBits!484))))

(declare-fun b!92668 () Bool)

(assert (=> b!92668 (= e!60891 (or (bvsgt ((_ sign_extend 32) (size!1963 (buf!2339 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4664 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4659 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!92669 () Bool)

(declare-fun res!76499 () Bool)

(assert (=> b!92669 (=> (not res!76499) (not e!60891))))

(assert (=> b!92669 (= res!76499 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92670 () Bool)

(declare-fun res!76497 () Bool)

(assert (=> b!92670 (=> (not res!76497) (not e!60891))))

(assert (=> b!92670 (= res!76497 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92671 () Bool)

(declare-fun res!76494 () Bool)

(assert (=> b!92671 (=> (not res!76494) (not e!60891))))

(assert (=> b!92671 (= res!76494 (and (= (buf!2339 bitStream1!8) (buf!2339 bitStream2!8)) (= (buf!2339 bitStream1!8) (buf!2339 base!8))))))

(declare-fun b!92672 () Bool)

(declare-fun e!60895 () Bool)

(declare-fun array_inv!1795 (array!4338) Bool)

(assert (=> b!92672 (= e!60895 (array_inv!1795 (buf!2339 base!8)))))

(declare-fun res!76496 () Bool)

(assert (=> start!18666 (=> (not res!76496) (not e!60891))))

(assert (=> start!18666 (= res!76496 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18666 e!60891))

(assert (=> start!18666 true))

(declare-fun e!60896 () Bool)

(declare-fun inv!12 (BitStream!3460) Bool)

(assert (=> start!18666 (and (inv!12 bitStream1!8) e!60896)))

(declare-fun e!60894 () Bool)

(assert (=> start!18666 (and (inv!12 bitStream2!8) e!60894)))

(assert (=> start!18666 (and (inv!12 base!8) e!60895)))

(declare-fun b!92673 () Bool)

(assert (=> b!92673 (= e!60894 (array_inv!1795 (buf!2339 bitStream2!8)))))

(declare-fun b!92674 () Bool)

(declare-fun res!76491 () Bool)

(assert (=> b!92674 (=> (not res!76491) (not e!60891))))

(declare-datatypes ((List!836 0))(
  ( (Nil!833) (Cons!832 (h!951 Bool) (t!1586 List!836)) )
))
(declare-fun listBits!13 () List!836)

(declare-fun length!427 (List!836) Int)

(assert (=> b!92674 (= res!76491 (> (length!427 listBits!13) 0))))

(declare-fun b!92675 () Bool)

(declare-fun res!76495 () Bool)

(assert (=> b!92675 (=> (not res!76495) (not e!60891))))

(assert (=> b!92675 (= res!76495 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1963 (buf!2339 bitStream1!8)) (currentByte!4664 bitStream1!8) (currentBit!4659 bitStream1!8))) (bitIndex!0 (size!1963 (buf!2339 bitStream2!8)) (currentByte!4664 bitStream2!8) (currentBit!4659 bitStream2!8))))))

(declare-fun b!92676 () Bool)

(assert (=> b!92676 (= e!60896 (array_inv!1795 (buf!2339 bitStream1!8)))))

(assert (= (and start!18666 res!76496) b!92674))

(assert (= (and b!92674 res!76491) b!92670))

(assert (= (and b!92670 res!76497) b!92669))

(assert (= (and b!92669 res!76499) b!92666))

(assert (= (and b!92666 res!76493) b!92671))

(assert (= (and b!92671 res!76494) b!92665))

(assert (= (and b!92665 res!76492) b!92675))

(assert (= (and b!92675 res!76495) b!92667))

(assert (= (and b!92667 res!76498) b!92668))

(assert (= start!18666 b!92676))

(assert (= start!18666 b!92673))

(assert (= start!18666 b!92672))

(declare-fun m!136589 () Bool)

(assert (=> b!92669 m!136589))

(declare-fun m!136591 () Bool)

(assert (=> b!92675 m!136591))

(declare-fun m!136593 () Bool)

(assert (=> b!92675 m!136593))

(declare-fun m!136595 () Bool)

(assert (=> start!18666 m!136595))

(declare-fun m!136597 () Bool)

(assert (=> start!18666 m!136597))

(declare-fun m!136599 () Bool)

(assert (=> start!18666 m!136599))

(declare-fun m!136601 () Bool)

(assert (=> b!92674 m!136601))

(declare-fun m!136603 () Bool)

(assert (=> b!92672 m!136603))

(declare-fun m!136605 () Bool)

(assert (=> b!92673 m!136605))

(declare-fun m!136607 () Bool)

(assert (=> b!92676 m!136607))

(declare-fun m!136609 () Bool)

(assert (=> b!92667 m!136609))

(declare-fun m!136611 () Bool)

(assert (=> b!92670 m!136611))

(declare-fun m!136613 () Bool)

(assert (=> b!92665 m!136613))

(declare-fun m!136615 () Bool)

(assert (=> b!92666 m!136615))

(push 1)

(assert (not b!92675))

(assert (not b!92669))

(assert (not b!92676))

(assert (not b!92670))

(assert (not b!92666))

(assert (not b!92665))

(assert (not b!92673))

(assert (not start!18666))

(assert (not b!92672))

(assert (not b!92674))

(assert (not b!92667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

