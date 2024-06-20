; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27432 () Bool)

(assert start!27432)

(declare-datatypes ((array!6447 0))(
  ( (array!6448 (arr!3624 (Array (_ BitVec 32) (_ BitVec 8))) (size!2917 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5092 0))(
  ( (BitStream!5093 (buf!3338 array!6447) (currentByte!6198 (_ BitVec 32)) (currentBit!6193 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12382 0))(
  ( (tuple2!12383 (_1!6521 BitStream!5092) (_2!6521 (_ BitVec 8))) )
))
(declare-fun lt!219159 () tuple2!12382)

(declare-fun b!140838 () Bool)

(declare-fun arr!237 () array!6447)

(declare-datatypes ((tuple2!12384 0))(
  ( (tuple2!12385 (_1!6522 BitStream!5092) (_2!6522 BitStream!5092)) )
))
(declare-fun lt!219158 () tuple2!12384)

(declare-fun e!93829 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!140838 (= e!93829 (and (= (_2!6521 lt!219159) (select (arr!3624 arr!237) from!447)) (= (_1!6521 lt!219159) (_2!6522 lt!219158))))))

(declare-fun readBytePure!0 (BitStream!5092) tuple2!12382)

(assert (=> b!140838 (= lt!219159 (readBytePure!0 (_1!6522 lt!219158)))))

(declare-fun thiss!1634 () BitStream!5092)

(declare-datatypes ((Unit!8816 0))(
  ( (Unit!8817) )
))
(declare-datatypes ((tuple2!12386 0))(
  ( (tuple2!12387 (_1!6523 Unit!8816) (_2!6523 BitStream!5092)) )
))
(declare-fun lt!219160 () tuple2!12386)

(declare-fun reader!0 (BitStream!5092 BitStream!5092) tuple2!12384)

(assert (=> b!140838 (= lt!219158 (reader!0 thiss!1634 (_2!6523 lt!219160)))))

(declare-fun b!140839 () Bool)

(declare-fun res!117443 () Bool)

(declare-fun e!93833 () Bool)

(assert (=> b!140839 (=> (not res!117443) (not e!93833))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140839 (= res!117443 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2917 (buf!3338 thiss!1634))) ((_ sign_extend 32) (currentByte!6198 thiss!1634)) ((_ sign_extend 32) (currentBit!6193 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140840 () Bool)

(declare-fun e!93834 () Bool)

(assert (=> b!140840 (= e!93834 true)))

(declare-fun lt!219161 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140840 (= lt!219161 (bitIndex!0 (size!2917 (buf!3338 thiss!1634)) (currentByte!6198 thiss!1634) (currentBit!6193 thiss!1634)))))

(declare-fun b!140841 () Bool)

(assert (=> b!140841 (= e!93833 (not e!93834))))

(declare-fun res!117442 () Bool)

(assert (=> b!140841 (=> res!117442 e!93834)))

(assert (=> b!140841 (= res!117442 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2917 (buf!3338 (_2!6523 lt!219160))) (currentByte!6198 (_2!6523 lt!219160)) (currentBit!6193 (_2!6523 lt!219160)))))))

(assert (=> b!140841 e!93829))

(declare-fun res!117444 () Bool)

(assert (=> b!140841 (=> (not res!117444) (not e!93829))))

(assert (=> b!140841 (= res!117444 (= (size!2917 (buf!3338 thiss!1634)) (size!2917 (buf!3338 (_2!6523 lt!219160)))))))

(declare-fun appendByte!0 (BitStream!5092 (_ BitVec 8)) tuple2!12386)

(assert (=> b!140841 (= lt!219160 (appendByte!0 thiss!1634 (select (arr!3624 arr!237) from!447)))))

(declare-fun b!140842 () Bool)

(declare-fun res!117439 () Bool)

(assert (=> b!140842 (=> (not res!117439) (not e!93833))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140842 (= res!117439 (invariant!0 (currentBit!6193 thiss!1634) (currentByte!6198 thiss!1634) (size!2917 (buf!3338 thiss!1634))))))

(declare-fun b!140843 () Bool)

(declare-fun res!117445 () Bool)

(assert (=> b!140843 (=> (not res!117445) (not e!93829))))

(declare-fun isPrefixOf!0 (BitStream!5092 BitStream!5092) Bool)

(assert (=> b!140843 (= res!117445 (isPrefixOf!0 thiss!1634 (_2!6523 lt!219160)))))

(declare-fun b!140844 () Bool)

(declare-fun res!117441 () Bool)

(assert (=> b!140844 (=> (not res!117441) (not e!93829))))

(assert (=> b!140844 (= res!117441 (= (bitIndex!0 (size!2917 (buf!3338 (_2!6523 lt!219160))) (currentByte!6198 (_2!6523 lt!219160)) (currentBit!6193 (_2!6523 lt!219160))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2917 (buf!3338 thiss!1634)) (currentByte!6198 thiss!1634) (currentBit!6193 thiss!1634)))))))

(declare-fun res!117438 () Bool)

(assert (=> start!27432 (=> (not res!117438) (not e!93833))))

(assert (=> start!27432 (= res!117438 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2917 arr!237))))))

(assert (=> start!27432 e!93833))

(assert (=> start!27432 true))

(declare-fun array_inv!2706 (array!6447) Bool)

(assert (=> start!27432 (array_inv!2706 arr!237)))

(declare-fun e!93832 () Bool)

(declare-fun inv!12 (BitStream!5092) Bool)

(assert (=> start!27432 (and (inv!12 thiss!1634) e!93832)))

(declare-fun b!140845 () Bool)

(assert (=> b!140845 (= e!93832 (array_inv!2706 (buf!3338 thiss!1634)))))

(declare-fun b!140846 () Bool)

(declare-fun res!117440 () Bool)

(assert (=> b!140846 (=> (not res!117440) (not e!93833))))

(assert (=> b!140846 (= res!117440 (bvslt from!447 to!404))))

(assert (= (and start!27432 res!117438) b!140839))

(assert (= (and b!140839 res!117443) b!140846))

(assert (= (and b!140846 res!117440) b!140842))

(assert (= (and b!140842 res!117439) b!140841))

(assert (= (and b!140841 res!117444) b!140844))

(assert (= (and b!140844 res!117441) b!140843))

(assert (= (and b!140843 res!117445) b!140838))

(assert (= (and b!140841 (not res!117442)) b!140840))

(assert (= start!27432 b!140845))

(declare-fun m!216653 () Bool)

(assert (=> b!140842 m!216653))

(declare-fun m!216655 () Bool)

(assert (=> b!140839 m!216655))

(declare-fun m!216657 () Bool)

(assert (=> b!140844 m!216657))

(declare-fun m!216659 () Bool)

(assert (=> b!140844 m!216659))

(declare-fun m!216661 () Bool)

(assert (=> b!140845 m!216661))

(assert (=> b!140840 m!216659))

(assert (=> b!140841 m!216657))

(declare-fun m!216663 () Bool)

(assert (=> b!140841 m!216663))

(assert (=> b!140841 m!216663))

(declare-fun m!216665 () Bool)

(assert (=> b!140841 m!216665))

(declare-fun m!216667 () Bool)

(assert (=> start!27432 m!216667))

(declare-fun m!216669 () Bool)

(assert (=> start!27432 m!216669))

(assert (=> b!140838 m!216663))

(declare-fun m!216671 () Bool)

(assert (=> b!140838 m!216671))

(declare-fun m!216673 () Bool)

(assert (=> b!140838 m!216673))

(declare-fun m!216675 () Bool)

(assert (=> b!140843 m!216675))

(push 1)

(assert (not b!140843))

(assert (not b!140841))

(assert (not b!140840))

(assert (not b!140839))

(assert (not b!140838))

(assert (not b!140845))

(assert (not b!140842))

(assert (not start!27432))

(assert (not b!140844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

