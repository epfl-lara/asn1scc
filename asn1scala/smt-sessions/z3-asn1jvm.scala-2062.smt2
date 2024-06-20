; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52432 () Bool)

(assert start!52432)

(declare-fun b!241363 () Bool)

(declare-fun e!167292 () Bool)

(declare-fun e!167293 () Bool)

(assert (=> b!241363 (= e!167292 e!167293)))

(declare-fun res!201484 () Bool)

(assert (=> b!241363 (=> (not res!201484) (not e!167293))))

(declare-datatypes ((array!13243 0))(
  ( (array!13244 (arr!6788 (Array (_ BitVec 32) (_ BitVec 8))) (size!5801 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10524 0))(
  ( (BitStream!10525 (buf!6267 array!13243) (currentByte!11630 (_ BitVec 32)) (currentBit!11625 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17685 0))(
  ( (Unit!17686) )
))
(declare-datatypes ((tuple2!20584 0))(
  ( (tuple2!20585 (_1!11214 Unit!17685) (_2!11214 BitStream!10524)) )
))
(declare-fun lt!376925 () tuple2!20584)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20586 0))(
  ( (tuple2!20587 (_1!11215 BitStream!10524) (_2!11215 Bool)) )
))
(declare-fun lt!376921 () tuple2!20586)

(assert (=> b!241363 (= res!201484 (and (= (_2!11215 lt!376921) bit!26) (= (_1!11215 lt!376921) (_2!11214 lt!376925))))))

(declare-fun thiss!1005 () BitStream!10524)

(declare-fun readBitPure!0 (BitStream!10524) tuple2!20586)

(declare-fun readerFrom!0 (BitStream!10524 (_ BitVec 32) (_ BitVec 32)) BitStream!10524)

(assert (=> b!241363 (= lt!376921 (readBitPure!0 (readerFrom!0 (_2!11214 lt!376925) (currentBit!11625 thiss!1005) (currentByte!11630 thiss!1005))))))

(declare-fun res!201480 () Bool)

(declare-fun e!167291 () Bool)

(assert (=> start!52432 (=> (not res!201480) (not e!167291))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52432 (= res!201480 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52432 e!167291))

(assert (=> start!52432 true))

(declare-fun e!167294 () Bool)

(declare-fun inv!12 (BitStream!10524) Bool)

(assert (=> start!52432 (and (inv!12 thiss!1005) e!167294)))

(declare-fun b!241364 () Bool)

(declare-fun lt!376923 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241364 (= e!167293 (= (bitIndex!0 (size!5801 (buf!6267 (_1!11215 lt!376921))) (currentByte!11630 (_1!11215 lt!376921)) (currentBit!11625 (_1!11215 lt!376921))) lt!376923))))

(declare-fun b!241365 () Bool)

(declare-fun array_inv!5542 (array!13243) Bool)

(assert (=> b!241365 (= e!167294 (array_inv!5542 (buf!6267 thiss!1005)))))

(declare-fun b!241366 () Bool)

(declare-fun e!167289 () Bool)

(assert (=> b!241366 (= e!167289 e!167292)))

(declare-fun res!201483 () Bool)

(assert (=> b!241366 (=> (not res!201483) (not e!167292))))

(declare-fun lt!376924 () (_ BitVec 64))

(assert (=> b!241366 (= res!201483 (= lt!376923 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376924)))))

(assert (=> b!241366 (= lt!376923 (bitIndex!0 (size!5801 (buf!6267 (_2!11214 lt!376925))) (currentByte!11630 (_2!11214 lt!376925)) (currentBit!11625 (_2!11214 lt!376925))))))

(assert (=> b!241366 (= lt!376924 (bitIndex!0 (size!5801 (buf!6267 thiss!1005)) (currentByte!11630 thiss!1005) (currentBit!11625 thiss!1005)))))

(declare-fun b!241367 () Bool)

(declare-fun res!201482 () Bool)

(assert (=> b!241367 (=> (not res!201482) (not e!167291))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241367 (= res!201482 (validate_offset_bits!1 ((_ sign_extend 32) (size!5801 (buf!6267 thiss!1005))) ((_ sign_extend 32) (currentByte!11630 thiss!1005)) ((_ sign_extend 32) (currentBit!11625 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241368 () Bool)

(declare-fun res!201486 () Bool)

(assert (=> b!241368 (=> (not res!201486) (not e!167291))))

(assert (=> b!241368 (= res!201486 (bvslt from!289 nBits!297))))

(declare-fun b!241369 () Bool)

(declare-fun res!201481 () Bool)

(assert (=> b!241369 (=> (not res!201481) (not e!167292))))

(declare-fun isPrefixOf!0 (BitStream!10524 BitStream!10524) Bool)

(assert (=> b!241369 (= res!201481 (isPrefixOf!0 thiss!1005 (_2!11214 lt!376925)))))

(declare-fun b!241370 () Bool)

(assert (=> b!241370 (= e!167291 (not true))))

(declare-fun lt!376926 () (_ BitVec 64))

(assert (=> b!241370 (= lt!376926 (bitIndex!0 (size!5801 (buf!6267 (_2!11214 lt!376925))) (currentByte!11630 (_2!11214 lt!376925)) (currentBit!11625 (_2!11214 lt!376925))))))

(declare-fun lt!376922 () (_ BitVec 64))

(assert (=> b!241370 (= lt!376922 (bitIndex!0 (size!5801 (buf!6267 thiss!1005)) (currentByte!11630 thiss!1005) (currentBit!11625 thiss!1005)))))

(assert (=> b!241370 e!167289))

(declare-fun res!201485 () Bool)

(assert (=> b!241370 (=> (not res!201485) (not e!167289))))

(assert (=> b!241370 (= res!201485 (= (size!5801 (buf!6267 thiss!1005)) (size!5801 (buf!6267 (_2!11214 lt!376925)))))))

(declare-fun appendBit!0 (BitStream!10524 Bool) tuple2!20584)

(assert (=> b!241370 (= lt!376925 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52432 res!201480) b!241367))

(assert (= (and b!241367 res!201482) b!241368))

(assert (= (and b!241368 res!201486) b!241370))

(assert (= (and b!241370 res!201485) b!241366))

(assert (= (and b!241366 res!201483) b!241369))

(assert (= (and b!241369 res!201481) b!241363))

(assert (= (and b!241363 res!201484) b!241364))

(assert (= start!52432 b!241365))

(declare-fun m!364051 () Bool)

(assert (=> b!241370 m!364051))

(declare-fun m!364053 () Bool)

(assert (=> b!241370 m!364053))

(declare-fun m!364055 () Bool)

(assert (=> b!241370 m!364055))

(declare-fun m!364057 () Bool)

(assert (=> b!241369 m!364057))

(declare-fun m!364059 () Bool)

(assert (=> b!241365 m!364059))

(declare-fun m!364061 () Bool)

(assert (=> b!241363 m!364061))

(assert (=> b!241363 m!364061))

(declare-fun m!364063 () Bool)

(assert (=> b!241363 m!364063))

(declare-fun m!364065 () Bool)

(assert (=> b!241367 m!364065))

(declare-fun m!364067 () Bool)

(assert (=> b!241364 m!364067))

(assert (=> b!241366 m!364051))

(assert (=> b!241366 m!364053))

(declare-fun m!364069 () Bool)

(assert (=> start!52432 m!364069))

(check-sat (not b!241367) (not start!52432) (not b!241366) (not b!241370) (not b!241363) (not b!241365) (not b!241364) (not b!241369))
