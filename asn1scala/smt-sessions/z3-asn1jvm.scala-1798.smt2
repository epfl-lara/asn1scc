; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48902 () Bool)

(assert start!48902)

(declare-fun b!231474 () Bool)

(declare-fun res!193878 () Bool)

(declare-fun e!159188 () Bool)

(assert (=> b!231474 (=> (not res!193878) (not e!159188))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-datatypes ((array!11871 0))(
  ( (array!11872 (arr!6188 (Array (_ BitVec 32) (_ BitVec 8))) (size!5201 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9498 0))(
  ( (BitStream!9499 (buf!5742 array!11871) (currentByte!10749 (_ BitVec 32)) (currentBit!10744 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9498)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231474 (= res!193878 (bvsle bits!86 (bitIndex!0 (size!5201 (buf!5742 b2!99)) (currentByte!10749 b2!99) (currentBit!10744 b2!99))))))

(declare-fun b!231475 () Bool)

(declare-fun res!193880 () Bool)

(assert (=> b!231475 (=> (not res!193880) (not e!159188))))

(declare-fun b1!101 () BitStream!9498)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231475 (= res!193880 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5201 (buf!5742 b1!101))) ((_ sign_extend 32) (currentByte!10749 b1!101)) ((_ sign_extend 32) (currentBit!10744 b1!101)) bytes!19))))

(declare-fun res!193879 () Bool)

(assert (=> start!48902 (=> (not res!193879) (not e!159188))))

(assert (=> start!48902 (= res!193879 (and (= (size!5201 (buf!5742 b1!101)) (size!5201 (buf!5742 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48902 e!159188))

(declare-fun e!159191 () Bool)

(declare-fun inv!12 (BitStream!9498) Bool)

(assert (=> start!48902 (and (inv!12 b1!101) e!159191)))

(declare-fun e!159190 () Bool)

(assert (=> start!48902 (and (inv!12 b2!99) e!159190)))

(assert (=> start!48902 true))

(declare-fun b!231476 () Bool)

(assert (=> b!231476 (= e!159188 false)))

(declare-fun lt!368703 () (_ BitVec 64))

(assert (=> b!231476 (= lt!368703 (bitIndex!0 (size!5201 (buf!5742 b1!101)) (currentByte!10749 b1!101) (currentBit!10744 b1!101)))))

(declare-fun b!231477 () Bool)

(declare-fun array_inv!4942 (array!11871) Bool)

(assert (=> b!231477 (= e!159190 (array_inv!4942 (buf!5742 b2!99)))))

(declare-fun b!231478 () Bool)

(assert (=> b!231478 (= e!159191 (array_inv!4942 (buf!5742 b1!101)))))

(declare-fun b!231479 () Bool)

(declare-fun res!193881 () Bool)

(assert (=> b!231479 (=> (not res!193881) (not e!159188))))

(assert (=> b!231479 (= res!193881 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!48902 res!193879) b!231474))

(assert (= (and b!231474 res!193878) b!231479))

(assert (= (and b!231479 res!193881) b!231475))

(assert (= (and b!231475 res!193880) b!231476))

(assert (= start!48902 b!231478))

(assert (= start!48902 b!231477))

(declare-fun m!354589 () Bool)

(assert (=> b!231477 m!354589))

(declare-fun m!354591 () Bool)

(assert (=> b!231475 m!354591))

(declare-fun m!354593 () Bool)

(assert (=> start!48902 m!354593))

(declare-fun m!354595 () Bool)

(assert (=> start!48902 m!354595))

(declare-fun m!354597 () Bool)

(assert (=> b!231474 m!354597))

(declare-fun m!354599 () Bool)

(assert (=> b!231478 m!354599))

(declare-fun m!354601 () Bool)

(assert (=> b!231476 m!354601))

(check-sat (not b!231475) (not b!231474) (not b!231476) (not start!48902) (not b!231478) (not b!231477))
