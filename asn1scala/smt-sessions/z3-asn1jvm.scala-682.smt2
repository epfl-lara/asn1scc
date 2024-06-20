; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19132 () Bool)

(assert start!19132)

(declare-fun b!95682 () Bool)

(declare-fun res!78731 () Bool)

(declare-fun e!62702 () Bool)

(assert (=> b!95682 (=> (not res!78731) (not e!62702))))

(declare-datatypes ((array!4472 0))(
  ( (array!4473 (arr!2641 (Array (_ BitVec 32) (_ BitVec 8))) (size!2042 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3570 0))(
  ( (BitStream!3571 (buf!2394 array!4472) (currentByte!4772 (_ BitVec 32)) (currentBit!4767 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3570)

(declare-fun bitStream2!8 () BitStream!3570)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!95682 (= res!78731 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2042 (buf!2394 bitStream1!8)) (currentByte!4772 bitStream1!8) (currentBit!4767 bitStream1!8))) (bitIndex!0 (size!2042 (buf!2394 bitStream2!8)) (currentByte!4772 bitStream2!8) (currentBit!4767 bitStream2!8))))))

(declare-fun b!95683 () Bool)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!95683 (= e!62702 (and (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!95684 () Bool)

(declare-fun e!62704 () Bool)

(declare-fun thiss!1534 () BitStream!3570)

(declare-fun array_inv!1850 (array!4472) Bool)

(assert (=> b!95684 (= e!62704 (array_inv!1850 (buf!2394 thiss!1534)))))

(declare-fun b!95685 () Bool)

(declare-fun res!78735 () Bool)

(assert (=> b!95685 (=> (not res!78735) (not e!62702))))

(declare-fun base!8 () BitStream!3570)

(assert (=> b!95685 (= res!78735 (and (= (buf!2394 bitStream1!8) (buf!2394 bitStream2!8)) (= (buf!2394 bitStream1!8) (buf!2394 base!8))))))

(declare-fun b!95687 () Bool)

(declare-fun res!78736 () Bool)

(assert (=> b!95687 (=> (not res!78736) (not e!62702))))

(declare-datatypes ((List!891 0))(
  ( (Nil!888) (Cons!887 (h!1006 Bool) (t!1641 List!891)) )
))
(declare-fun listBits!13 () List!891)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3570 BitStream!3570 (_ BitVec 64)) List!891)

(assert (=> b!95687 (= res!78736 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!95688 () Bool)

(declare-fun res!78739 () Bool)

(assert (=> b!95688 (=> (not res!78739) (not e!62702))))

(declare-fun isPrefixOf!0 (BitStream!3570 BitStream!3570) Bool)

(assert (=> b!95688 (= res!78739 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95689 () Bool)

(declare-fun res!78732 () Bool)

(assert (=> b!95689 (=> (not res!78732) (not e!62702))))

(assert (=> b!95689 (= res!78732 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95690 () Bool)

(declare-fun e!62699 () Bool)

(assert (=> b!95690 (= e!62699 (array_inv!1850 (buf!2394 bitStream1!8)))))

(declare-fun b!95691 () Bool)

(declare-fun res!78738 () Bool)

(assert (=> b!95691 (=> (not res!78738) (not e!62702))))

(assert (=> b!95691 (= res!78738 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95692 () Bool)

(declare-fun res!78737 () Bool)

(assert (=> b!95692 (=> (not res!78737) (not e!62702))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!95692 (= res!78737 (validate_offset_bits!1 ((_ sign_extend 32) (size!2042 (buf!2394 bitStream2!8))) ((_ sign_extend 32) (currentByte!4772 bitStream2!8)) ((_ sign_extend 32) (currentBit!4767 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!95693 () Bool)

(declare-fun e!62700 () Bool)

(assert (=> b!95693 (= e!62700 (array_inv!1850 (buf!2394 bitStream2!8)))))

(declare-fun b!95694 () Bool)

(declare-fun res!78733 () Bool)

(assert (=> b!95694 (=> (not res!78733) (not e!62702))))

(declare-fun length!482 (List!891) Int)

(assert (=> b!95694 (= res!78733 (> (length!482 listBits!13) 0))))

(declare-fun b!95686 () Bool)

(declare-fun res!78741 () Bool)

(assert (=> b!95686 (=> (not res!78741) (not e!62702))))

(assert (=> b!95686 (= res!78741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2042 (buf!2394 bitStream1!8))) ((_ sign_extend 32) (currentByte!4772 bitStream1!8)) ((_ sign_extend 32) (currentBit!4767 bitStream1!8)) nBits!484))))

(declare-fun res!78740 () Bool)

(assert (=> start!19132 (=> (not res!78740) (not e!62702))))

(assert (=> start!19132 (= res!78740 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19132 e!62702))

(assert (=> start!19132 true))

(declare-fun inv!12 (BitStream!3570) Bool)

(assert (=> start!19132 (and (inv!12 bitStream1!8) e!62699)))

(assert (=> start!19132 (and (inv!12 bitStream2!8) e!62700)))

(declare-fun e!62701 () Bool)

(assert (=> start!19132 (and (inv!12 base!8) e!62701)))

(assert (=> start!19132 (and (inv!12 thiss!1534) e!62704)))

(declare-fun b!95695 () Bool)

(assert (=> b!95695 (= e!62701 (array_inv!1850 (buf!2394 base!8)))))

(declare-fun b!95696 () Bool)

(declare-fun res!78734 () Bool)

(assert (=> b!95696 (=> (not res!78734) (not e!62702))))

(assert (=> b!95696 (= res!78734 (bvslt (bitIndex!0 (size!2042 (buf!2394 base!8)) (currentByte!4772 base!8) (currentBit!4767 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(assert (= (and start!19132 res!78740) b!95694))

(assert (= (and b!95694 res!78733) b!95688))

(assert (= (and b!95688 res!78739) b!95689))

(assert (= (and b!95689 res!78732) b!95691))

(assert (= (and b!95691 res!78738) b!95685))

(assert (= (and b!95685 res!78735) b!95696))

(assert (= (and b!95696 res!78734) b!95682))

(assert (= (and b!95682 res!78731) b!95686))

(assert (= (and b!95686 res!78741) b!95692))

(assert (= (and b!95692 res!78737) b!95687))

(assert (= (and b!95687 res!78736) b!95683))

(assert (= start!19132 b!95690))

(assert (= start!19132 b!95693))

(assert (= start!19132 b!95695))

(assert (= start!19132 b!95684))

(declare-fun m!139037 () Bool)

(assert (=> b!95696 m!139037))

(declare-fun m!139039 () Bool)

(assert (=> b!95687 m!139039))

(declare-fun m!139041 () Bool)

(assert (=> b!95688 m!139041))

(declare-fun m!139043 () Bool)

(assert (=> b!95689 m!139043))

(declare-fun m!139045 () Bool)

(assert (=> b!95695 m!139045))

(declare-fun m!139047 () Bool)

(assert (=> b!95682 m!139047))

(declare-fun m!139049 () Bool)

(assert (=> b!95682 m!139049))

(declare-fun m!139051 () Bool)

(assert (=> b!95686 m!139051))

(declare-fun m!139053 () Bool)

(assert (=> b!95692 m!139053))

(declare-fun m!139055 () Bool)

(assert (=> start!19132 m!139055))

(declare-fun m!139057 () Bool)

(assert (=> start!19132 m!139057))

(declare-fun m!139059 () Bool)

(assert (=> start!19132 m!139059))

(declare-fun m!139061 () Bool)

(assert (=> start!19132 m!139061))

(declare-fun m!139063 () Bool)

(assert (=> b!95690 m!139063))

(declare-fun m!139065 () Bool)

(assert (=> b!95684 m!139065))

(declare-fun m!139067 () Bool)

(assert (=> b!95693 m!139067))

(declare-fun m!139069 () Bool)

(assert (=> b!95691 m!139069))

(declare-fun m!139071 () Bool)

(assert (=> b!95694 m!139071))

(check-sat (not b!95690) (not b!95686) (not b!95691) (not b!95688) (not b!95682) (not b!95687) (not b!95684) (not b!95693) (not b!95694) (not b!95695) (not b!95689) (not b!95692) (not b!95696) (not start!19132))
