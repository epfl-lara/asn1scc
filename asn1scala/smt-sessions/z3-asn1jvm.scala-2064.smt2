; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52444 () Bool)

(assert start!52444)

(declare-fun b!241507 () Bool)

(declare-fun e!167398 () Bool)

(declare-datatypes ((array!13255 0))(
  ( (array!13256 (arr!6794 (Array (_ BitVec 32) (_ BitVec 8))) (size!5807 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10536 0))(
  ( (BitStream!10537 (buf!6273 array!13255) (currentByte!11636 (_ BitVec 32)) (currentBit!11631 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20608 0))(
  ( (tuple2!20609 (_1!11226 BitStream!10536) (_2!11226 Bool)) )
))
(declare-fun lt!377027 () tuple2!20608)

(declare-fun lt!377026 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241507 (= e!167398 (= (bitIndex!0 (size!5807 (buf!6273 (_1!11226 lt!377027))) (currentByte!11636 (_1!11226 lt!377027)) (currentBit!11631 (_1!11226 lt!377027))) lt!377026))))

(declare-fun b!241508 () Bool)

(declare-fun e!167402 () Bool)

(assert (=> b!241508 (= e!167402 e!167398)))

(declare-fun res!201610 () Bool)

(assert (=> b!241508 (=> (not res!201610) (not e!167398))))

(declare-datatypes ((Unit!17697 0))(
  ( (Unit!17698) )
))
(declare-datatypes ((tuple2!20610 0))(
  ( (tuple2!20611 (_1!11227 Unit!17697) (_2!11227 BitStream!10536)) )
))
(declare-fun lt!377028 () tuple2!20610)

(declare-fun bit!26 () Bool)

(assert (=> b!241508 (= res!201610 (and (= (_2!11226 lt!377027) bit!26) (= (_1!11226 lt!377027) (_2!11227 lt!377028))))))

(declare-fun thiss!1005 () BitStream!10536)

(declare-fun readBitPure!0 (BitStream!10536) tuple2!20608)

(declare-fun readerFrom!0 (BitStream!10536 (_ BitVec 32) (_ BitVec 32)) BitStream!10536)

(assert (=> b!241508 (= lt!377027 (readBitPure!0 (readerFrom!0 (_2!11227 lt!377028) (currentBit!11631 thiss!1005) (currentByte!11636 thiss!1005))))))

(declare-fun b!241509 () Bool)

(declare-fun e!167399 () Bool)

(declare-fun array_inv!5548 (array!13255) Bool)

(assert (=> b!241509 (= e!167399 (array_inv!5548 (buf!6273 thiss!1005)))))

(declare-fun b!241510 () Bool)

(declare-fun res!201608 () Bool)

(declare-fun e!167400 () Bool)

(assert (=> b!241510 (=> (not res!201608) (not e!167400))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241510 (= res!201608 (validate_offset_bits!1 ((_ sign_extend 32) (size!5807 (buf!6273 thiss!1005))) ((_ sign_extend 32) (currentByte!11636 thiss!1005)) ((_ sign_extend 32) (currentBit!11631 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241511 () Bool)

(declare-fun e!167397 () Bool)

(assert (=> b!241511 (= e!167397 e!167402)))

(declare-fun res!201606 () Bool)

(assert (=> b!241511 (=> (not res!201606) (not e!167402))))

(declare-fun lt!377024 () (_ BitVec 64))

(assert (=> b!241511 (= res!201606 (= lt!377026 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377024)))))

(assert (=> b!241511 (= lt!377026 (bitIndex!0 (size!5807 (buf!6273 (_2!11227 lt!377028))) (currentByte!11636 (_2!11227 lt!377028)) (currentBit!11631 (_2!11227 lt!377028))))))

(assert (=> b!241511 (= lt!377024 (bitIndex!0 (size!5807 (buf!6273 thiss!1005)) (currentByte!11636 thiss!1005) (currentBit!11631 thiss!1005)))))

(declare-fun b!241512 () Bool)

(assert (=> b!241512 (= e!167400 (not true))))

(assert (=> b!241512 (validate_offset_bits!1 ((_ sign_extend 32) (size!5807 (buf!6273 (_2!11227 lt!377028)))) ((_ sign_extend 32) (currentByte!11636 (_2!11227 lt!377028))) ((_ sign_extend 32) (currentBit!11631 (_2!11227 lt!377028))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377025 () Unit!17697)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10536 BitStream!10536 (_ BitVec 64) (_ BitVec 64)) Unit!17697)

(assert (=> b!241512 (= lt!377025 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11227 lt!377028) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241512 e!167397))

(declare-fun res!201607 () Bool)

(assert (=> b!241512 (=> (not res!201607) (not e!167397))))

(assert (=> b!241512 (= res!201607 (= (size!5807 (buf!6273 thiss!1005)) (size!5807 (buf!6273 (_2!11227 lt!377028)))))))

(declare-fun appendBit!0 (BitStream!10536 Bool) tuple2!20610)

(assert (=> b!241512 (= lt!377028 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!201611 () Bool)

(assert (=> start!52444 (=> (not res!201611) (not e!167400))))

(assert (=> start!52444 (= res!201611 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52444 e!167400))

(assert (=> start!52444 true))

(declare-fun inv!12 (BitStream!10536) Bool)

(assert (=> start!52444 (and (inv!12 thiss!1005) e!167399)))

(declare-fun b!241513 () Bool)

(declare-fun res!201612 () Bool)

(assert (=> b!241513 (=> (not res!201612) (not e!167402))))

(declare-fun isPrefixOf!0 (BitStream!10536 BitStream!10536) Bool)

(assert (=> b!241513 (= res!201612 (isPrefixOf!0 thiss!1005 (_2!11227 lt!377028)))))

(declare-fun b!241514 () Bool)

(declare-fun res!201609 () Bool)

(assert (=> b!241514 (=> (not res!201609) (not e!167400))))

(assert (=> b!241514 (= res!201609 (bvslt from!289 nBits!297))))

(assert (= (and start!52444 res!201611) b!241510))

(assert (= (and b!241510 res!201608) b!241514))

(assert (= (and b!241514 res!201609) b!241512))

(assert (= (and b!241512 res!201607) b!241511))

(assert (= (and b!241511 res!201606) b!241513))

(assert (= (and b!241513 res!201612) b!241508))

(assert (= (and b!241508 res!201610) b!241507))

(assert (= start!52444 b!241509))

(declare-fun m!364175 () Bool)

(assert (=> b!241512 m!364175))

(declare-fun m!364177 () Bool)

(assert (=> b!241512 m!364177))

(declare-fun m!364179 () Bool)

(assert (=> b!241512 m!364179))

(declare-fun m!364181 () Bool)

(assert (=> b!241510 m!364181))

(declare-fun m!364183 () Bool)

(assert (=> b!241509 m!364183))

(declare-fun m!364185 () Bool)

(assert (=> b!241507 m!364185))

(declare-fun m!364187 () Bool)

(assert (=> b!241508 m!364187))

(assert (=> b!241508 m!364187))

(declare-fun m!364189 () Bool)

(assert (=> b!241508 m!364189))

(declare-fun m!364191 () Bool)

(assert (=> b!241513 m!364191))

(declare-fun m!364193 () Bool)

(assert (=> b!241511 m!364193))

(declare-fun m!364195 () Bool)

(assert (=> b!241511 m!364195))

(declare-fun m!364197 () Bool)

(assert (=> start!52444 m!364197))

(check-sat (not b!241512) (not start!52444) (not b!241513) (not b!241507) (not b!241511) (not b!241510) (not b!241509) (not b!241508))
