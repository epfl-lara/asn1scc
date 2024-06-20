; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52450 () Bool)

(assert start!52450)

(declare-fun b!241579 () Bool)

(declare-fun res!201674 () Bool)

(declare-fun e!167454 () Bool)

(assert (=> b!241579 (=> (not res!201674) (not e!167454))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13261 0))(
  ( (array!13262 (arr!6797 (Array (_ BitVec 32) (_ BitVec 8))) (size!5810 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10542 0))(
  ( (BitStream!10543 (buf!6276 array!13261) (currentByte!11639 (_ BitVec 32)) (currentBit!11634 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10542)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241579 (= res!201674 (validate_offset_bits!1 ((_ sign_extend 32) (size!5810 (buf!6276 thiss!1005))) ((_ sign_extend 32) (currentByte!11639 thiss!1005)) ((_ sign_extend 32) (currentBit!11634 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241580 () Bool)

(declare-fun e!167456 () Bool)

(declare-datatypes ((tuple2!20620 0))(
  ( (tuple2!20621 (_1!11232 BitStream!10542) (_2!11232 Bool)) )
))
(declare-fun lt!377071 () tuple2!20620)

(declare-fun lt!377070 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241580 (= e!167456 (= (bitIndex!0 (size!5810 (buf!6276 (_1!11232 lt!377071))) (currentByte!11639 (_1!11232 lt!377071)) (currentBit!11634 (_1!11232 lt!377071))) lt!377070))))

(declare-fun b!241581 () Bool)

(declare-fun e!167455 () Bool)

(declare-fun e!167453 () Bool)

(assert (=> b!241581 (= e!167455 e!167453)))

(declare-fun res!201671 () Bool)

(assert (=> b!241581 (=> (not res!201671) (not e!167453))))

(declare-fun lt!377069 () (_ BitVec 64))

(assert (=> b!241581 (= res!201671 (= lt!377070 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377069)))))

(declare-datatypes ((Unit!17703 0))(
  ( (Unit!17704) )
))
(declare-datatypes ((tuple2!20622 0))(
  ( (tuple2!20623 (_1!11233 Unit!17703) (_2!11233 BitStream!10542)) )
))
(declare-fun lt!377072 () tuple2!20622)

(assert (=> b!241581 (= lt!377070 (bitIndex!0 (size!5810 (buf!6276 (_2!11233 lt!377072))) (currentByte!11639 (_2!11233 lt!377072)) (currentBit!11634 (_2!11233 lt!377072))))))

(assert (=> b!241581 (= lt!377069 (bitIndex!0 (size!5810 (buf!6276 thiss!1005)) (currentByte!11639 thiss!1005) (currentBit!11634 thiss!1005)))))

(declare-fun b!241582 () Bool)

(declare-fun res!201672 () Bool)

(assert (=> b!241582 (=> (not res!201672) (not e!167453))))

(declare-fun isPrefixOf!0 (BitStream!10542 BitStream!10542) Bool)

(assert (=> b!241582 (= res!201672 (isPrefixOf!0 thiss!1005 (_2!11233 lt!377072)))))

(declare-fun b!241583 () Bool)

(declare-fun res!201673 () Bool)

(assert (=> b!241583 (=> (not res!201673) (not e!167454))))

(assert (=> b!241583 (= res!201673 (bvslt from!289 nBits!297))))

(declare-fun res!201675 () Bool)

(assert (=> start!52450 (=> (not res!201675) (not e!167454))))

(assert (=> start!52450 (= res!201675 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52450 e!167454))

(assert (=> start!52450 true))

(declare-fun e!167452 () Bool)

(declare-fun inv!12 (BitStream!10542) Bool)

(assert (=> start!52450 (and (inv!12 thiss!1005) e!167452)))

(declare-fun b!241584 () Bool)

(declare-fun array_inv!5551 (array!13261) Bool)

(assert (=> b!241584 (= e!167452 (array_inv!5551 (buf!6276 thiss!1005)))))

(declare-fun b!241585 () Bool)

(assert (=> b!241585 (= e!167453 e!167456)))

(declare-fun res!201670 () Bool)

(assert (=> b!241585 (=> (not res!201670) (not e!167456))))

(declare-fun bit!26 () Bool)

(assert (=> b!241585 (= res!201670 (and (= (_2!11232 lt!377071) bit!26) (= (_1!11232 lt!377071) (_2!11233 lt!377072))))))

(declare-fun readBitPure!0 (BitStream!10542) tuple2!20620)

(declare-fun readerFrom!0 (BitStream!10542 (_ BitVec 32) (_ BitVec 32)) BitStream!10542)

(assert (=> b!241585 (= lt!377071 (readBitPure!0 (readerFrom!0 (_2!11233 lt!377072) (currentBit!11634 thiss!1005) (currentByte!11639 thiss!1005))))))

(declare-fun b!241586 () Bool)

(assert (=> b!241586 (= e!167454 (not true))))

(assert (=> b!241586 (validate_offset_bits!1 ((_ sign_extend 32) (size!5810 (buf!6276 (_2!11233 lt!377072)))) ((_ sign_extend 32) (currentByte!11639 (_2!11233 lt!377072))) ((_ sign_extend 32) (currentBit!11634 (_2!11233 lt!377072))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377073 () Unit!17703)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10542 BitStream!10542 (_ BitVec 64) (_ BitVec 64)) Unit!17703)

(assert (=> b!241586 (= lt!377073 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11233 lt!377072) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241586 e!167455))

(declare-fun res!201669 () Bool)

(assert (=> b!241586 (=> (not res!201669) (not e!167455))))

(assert (=> b!241586 (= res!201669 (= (size!5810 (buf!6276 thiss!1005)) (size!5810 (buf!6276 (_2!11233 lt!377072)))))))

(declare-fun appendBit!0 (BitStream!10542 Bool) tuple2!20622)

(assert (=> b!241586 (= lt!377072 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52450 res!201675) b!241579))

(assert (= (and b!241579 res!201674) b!241583))

(assert (= (and b!241583 res!201673) b!241586))

(assert (= (and b!241586 res!201669) b!241581))

(assert (= (and b!241581 res!201671) b!241582))

(assert (= (and b!241582 res!201672) b!241585))

(assert (= (and b!241585 res!201670) b!241580))

(assert (= start!52450 b!241584))

(declare-fun m!364247 () Bool)

(assert (=> b!241585 m!364247))

(assert (=> b!241585 m!364247))

(declare-fun m!364249 () Bool)

(assert (=> b!241585 m!364249))

(declare-fun m!364251 () Bool)

(assert (=> b!241586 m!364251))

(declare-fun m!364253 () Bool)

(assert (=> b!241586 m!364253))

(declare-fun m!364255 () Bool)

(assert (=> b!241586 m!364255))

(declare-fun m!364257 () Bool)

(assert (=> b!241579 m!364257))

(declare-fun m!364259 () Bool)

(assert (=> b!241584 m!364259))

(declare-fun m!364261 () Bool)

(assert (=> b!241581 m!364261))

(declare-fun m!364263 () Bool)

(assert (=> b!241581 m!364263))

(declare-fun m!364265 () Bool)

(assert (=> start!52450 m!364265))

(declare-fun m!364267 () Bool)

(assert (=> b!241580 m!364267))

(declare-fun m!364269 () Bool)

(assert (=> b!241582 m!364269))

(check-sat (not b!241581) (not b!241580) (not b!241584) (not b!241582) (not b!241586) (not b!241579) (not b!241585) (not start!52450))
