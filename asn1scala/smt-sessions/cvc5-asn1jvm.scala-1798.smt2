; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48900 () Bool)

(assert start!48900)

(declare-fun b!231456 () Bool)

(declare-fun e!159176 () Bool)

(declare-datatypes ((array!11869 0))(
  ( (array!11870 (arr!6187 (Array (_ BitVec 32) (_ BitVec 8))) (size!5200 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9496 0))(
  ( (BitStream!9497 (buf!5741 array!11869) (currentByte!10748 (_ BitVec 32)) (currentBit!10743 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9496)

(declare-fun array_inv!4941 (array!11869) Bool)

(assert (=> b!231456 (= e!159176 (array_inv!4941 (buf!5741 b1!101)))))

(declare-fun b!231457 () Bool)

(declare-fun res!193868 () Bool)

(declare-fun e!159174 () Bool)

(assert (=> b!231457 (=> (not res!193868) (not e!159174))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231457 (= res!193868 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5200 (buf!5741 b1!101))) ((_ sign_extend 32) (currentByte!10748 b1!101)) ((_ sign_extend 32) (currentBit!10743 b1!101)) bytes!19))))

(declare-fun b!231458 () Bool)

(assert (=> b!231458 (= e!159174 false)))

(declare-fun lt!368700 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231458 (= lt!368700 (bitIndex!0 (size!5200 (buf!5741 b1!101)) (currentByte!10748 b1!101) (currentBit!10743 b1!101)))))

(declare-fun res!193867 () Bool)

(assert (=> start!48900 (=> (not res!193867) (not e!159174))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun b2!99 () BitStream!9496)

(assert (=> start!48900 (= res!193867 (and (= (size!5200 (buf!5741 b1!101)) (size!5200 (buf!5741 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48900 e!159174))

(declare-fun inv!12 (BitStream!9496) Bool)

(assert (=> start!48900 (and (inv!12 b1!101) e!159176)))

(declare-fun e!159172 () Bool)

(assert (=> start!48900 (and (inv!12 b2!99) e!159172)))

(assert (=> start!48900 true))

(declare-fun b!231459 () Bool)

(declare-fun res!193866 () Bool)

(assert (=> b!231459 (=> (not res!193866) (not e!159174))))

(assert (=> b!231459 (= res!193866 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!231460 () Bool)

(assert (=> b!231460 (= e!159172 (array_inv!4941 (buf!5741 b2!99)))))

(declare-fun b!231461 () Bool)

(declare-fun res!193869 () Bool)

(assert (=> b!231461 (=> (not res!193869) (not e!159174))))

(assert (=> b!231461 (= res!193869 (bvsle bits!86 (bitIndex!0 (size!5200 (buf!5741 b2!99)) (currentByte!10748 b2!99) (currentBit!10743 b2!99))))))

(assert (= (and start!48900 res!193867) b!231461))

(assert (= (and b!231461 res!193869) b!231459))

(assert (= (and b!231459 res!193866) b!231457))

(assert (= (and b!231457 res!193868) b!231458))

(assert (= start!48900 b!231456))

(assert (= start!48900 b!231460))

(declare-fun m!354575 () Bool)

(assert (=> b!231461 m!354575))

(declare-fun m!354577 () Bool)

(assert (=> b!231457 m!354577))

(declare-fun m!354579 () Bool)

(assert (=> b!231456 m!354579))

(declare-fun m!354581 () Bool)

(assert (=> b!231458 m!354581))

(declare-fun m!354583 () Bool)

(assert (=> start!48900 m!354583))

(declare-fun m!354585 () Bool)

(assert (=> start!48900 m!354585))

(declare-fun m!354587 () Bool)

(assert (=> b!231460 m!354587))

(push 1)

(assert (not b!231457))

(assert (not b!231458))

(assert (not b!231461))

(assert (not b!231460))

(assert (not start!48900))

(assert (not b!231456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

