; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27426 () Bool)

(assert start!27426)

(declare-fun b!140764 () Bool)

(declare-fun res!117375 () Bool)

(declare-fun e!93786 () Bool)

(assert (=> b!140764 (=> (not res!117375) (not e!93786))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6441 0))(
  ( (array!6442 (arr!3621 (Array (_ BitVec 32) (_ BitVec 8))) (size!2914 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5086 0))(
  ( (BitStream!5087 (buf!3335 array!6441) (currentByte!6195 (_ BitVec 32)) (currentBit!6190 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5086)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140764 (= res!117375 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2914 (buf!3335 thiss!1634))) ((_ sign_extend 32) (currentByte!6195 thiss!1634)) ((_ sign_extend 32) (currentBit!6190 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140765 () Bool)

(declare-fun res!117378 () Bool)

(assert (=> b!140765 (=> (not res!117378) (not e!93786))))

(assert (=> b!140765 (= res!117378 (bvslt from!447 to!404))))

(declare-datatypes ((tuple2!12364 0))(
  ( (tuple2!12365 (_1!6512 BitStream!5086) (_2!6512 (_ BitVec 8))) )
))
(declare-fun lt!219122 () tuple2!12364)

(declare-fun arr!237 () array!6441)

(declare-fun b!140766 () Bool)

(declare-fun e!93784 () Bool)

(declare-datatypes ((tuple2!12366 0))(
  ( (tuple2!12367 (_1!6513 BitStream!5086) (_2!6513 BitStream!5086)) )
))
(declare-fun lt!219124 () tuple2!12366)

(assert (=> b!140766 (= e!93784 (and (= (_2!6512 lt!219122) (select (arr!3621 arr!237) from!447)) (= (_1!6512 lt!219122) (_2!6513 lt!219124))))))

(declare-fun readBytePure!0 (BitStream!5086) tuple2!12364)

(assert (=> b!140766 (= lt!219122 (readBytePure!0 (_1!6513 lt!219124)))))

(declare-datatypes ((Unit!8810 0))(
  ( (Unit!8811) )
))
(declare-datatypes ((tuple2!12368 0))(
  ( (tuple2!12369 (_1!6514 Unit!8810) (_2!6514 BitStream!5086)) )
))
(declare-fun lt!219123 () tuple2!12368)

(declare-fun reader!0 (BitStream!5086 BitStream!5086) tuple2!12366)

(assert (=> b!140766 (= lt!219124 (reader!0 thiss!1634 (_2!6514 lt!219123)))))

(declare-fun b!140767 () Bool)

(declare-fun e!93785 () Bool)

(declare-fun array_inv!2703 (array!6441) Bool)

(assert (=> b!140767 (= e!93785 (array_inv!2703 (buf!3335 thiss!1634)))))

(declare-fun res!117377 () Bool)

(assert (=> start!27426 (=> (not res!117377) (not e!93786))))

(assert (=> start!27426 (= res!117377 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2914 arr!237))))))

(assert (=> start!27426 e!93786))

(assert (=> start!27426 true))

(assert (=> start!27426 (array_inv!2703 arr!237)))

(declare-fun inv!12 (BitStream!5086) Bool)

(assert (=> start!27426 (and (inv!12 thiss!1634) e!93785)))

(declare-fun b!140768 () Bool)

(declare-fun res!117379 () Bool)

(assert (=> b!140768 (=> (not res!117379) (not e!93784))))

(declare-fun isPrefixOf!0 (BitStream!5086 BitStream!5086) Bool)

(assert (=> b!140768 (= res!117379 (isPrefixOf!0 thiss!1634 (_2!6514 lt!219123)))))

(declare-fun b!140769 () Bool)

(declare-fun res!117373 () Bool)

(assert (=> b!140769 (=> (not res!117373) (not e!93786))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140769 (= res!117373 (invariant!0 (currentBit!6190 thiss!1634) (currentByte!6195 thiss!1634) (size!2914 (buf!3335 thiss!1634))))))

(declare-fun b!140770 () Bool)

(assert (=> b!140770 (= e!93786 (not true))))

(declare-fun lt!219125 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140770 (= lt!219125 (bitIndex!0 (size!2914 (buf!3335 (_2!6514 lt!219123))) (currentByte!6195 (_2!6514 lt!219123)) (currentBit!6190 (_2!6514 lt!219123))))))

(assert (=> b!140770 e!93784))

(declare-fun res!117376 () Bool)

(assert (=> b!140770 (=> (not res!117376) (not e!93784))))

(assert (=> b!140770 (= res!117376 (= (size!2914 (buf!3335 thiss!1634)) (size!2914 (buf!3335 (_2!6514 lt!219123)))))))

(declare-fun appendByte!0 (BitStream!5086 (_ BitVec 8)) tuple2!12368)

(assert (=> b!140770 (= lt!219123 (appendByte!0 thiss!1634 (select (arr!3621 arr!237) from!447)))))

(declare-fun b!140771 () Bool)

(declare-fun res!117374 () Bool)

(assert (=> b!140771 (=> (not res!117374) (not e!93784))))

(assert (=> b!140771 (= res!117374 (= (bitIndex!0 (size!2914 (buf!3335 (_2!6514 lt!219123))) (currentByte!6195 (_2!6514 lt!219123)) (currentBit!6190 (_2!6514 lt!219123))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2914 (buf!3335 thiss!1634)) (currentByte!6195 thiss!1634) (currentBit!6190 thiss!1634)))))))

(assert (= (and start!27426 res!117377) b!140764))

(assert (= (and b!140764 res!117375) b!140765))

(assert (= (and b!140765 res!117378) b!140769))

(assert (= (and b!140769 res!117373) b!140770))

(assert (= (and b!140770 res!117376) b!140771))

(assert (= (and b!140771 res!117374) b!140768))

(assert (= (and b!140768 res!117379) b!140766))

(assert (= start!27426 b!140767))

(declare-fun m!216581 () Bool)

(assert (=> b!140768 m!216581))

(declare-fun m!216583 () Bool)

(assert (=> b!140769 m!216583))

(declare-fun m!216585 () Bool)

(assert (=> b!140766 m!216585))

(declare-fun m!216587 () Bool)

(assert (=> b!140766 m!216587))

(declare-fun m!216589 () Bool)

(assert (=> b!140766 m!216589))

(declare-fun m!216591 () Bool)

(assert (=> start!27426 m!216591))

(declare-fun m!216593 () Bool)

(assert (=> start!27426 m!216593))

(declare-fun m!216595 () Bool)

(assert (=> b!140764 m!216595))

(declare-fun m!216597 () Bool)

(assert (=> b!140770 m!216597))

(assert (=> b!140770 m!216585))

(assert (=> b!140770 m!216585))

(declare-fun m!216599 () Bool)

(assert (=> b!140770 m!216599))

(assert (=> b!140771 m!216597))

(declare-fun m!216601 () Bool)

(assert (=> b!140771 m!216601))

(declare-fun m!216603 () Bool)

(assert (=> b!140767 m!216603))

(push 1)

(assert (not b!140768))

(assert (not b!140764))

(assert (not b!140766))

(assert (not b!140771))

(assert (not start!27426))

(assert (not b!140767))

(assert (not b!140770))

(assert (not b!140769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

