; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41272 () Bool)

(assert start!41272)

(declare-fun b!192137 () Bool)

(declare-fun e!132402 () Bool)

(declare-fun e!132403 () Bool)

(assert (=> b!192137 (= e!132402 (not e!132403))))

(declare-fun res!160435 () Bool)

(assert (=> b!192137 (=> res!160435 e!132403)))

(declare-fun lt!298815 () (_ BitVec 64))

(declare-fun lt!298800 () (_ BitVec 64))

(assert (=> b!192137 (= res!160435 (not (= lt!298815 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298800))))))

(declare-datatypes ((array!9946 0))(
  ( (array!9947 (arr!5315 (Array (_ BitVec 32) (_ BitVec 8))) (size!4385 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7878 0))(
  ( (BitStream!7879 (buf!4865 array!9946) (currentByte!9149 (_ BitVec 32)) (currentBit!9144 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13647 0))(
  ( (Unit!13648) )
))
(declare-datatypes ((tuple2!16612 0))(
  ( (tuple2!16613 (_1!8951 Unit!13647) (_2!8951 BitStream!7878)) )
))
(declare-fun lt!298818 () tuple2!16612)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192137 (= lt!298815 (bitIndex!0 (size!4385 (buf!4865 (_2!8951 lt!298818))) (currentByte!9149 (_2!8951 lt!298818)) (currentBit!9144 (_2!8951 lt!298818))))))

(declare-fun thiss!1204 () BitStream!7878)

(assert (=> b!192137 (= lt!298800 (bitIndex!0 (size!4385 (buf!4865 thiss!1204)) (currentByte!9149 thiss!1204) (currentBit!9144 thiss!1204)))))

(declare-fun e!132405 () Bool)

(assert (=> b!192137 e!132405))

(declare-fun res!160430 () Bool)

(assert (=> b!192137 (=> (not res!160430) (not e!132405))))

(assert (=> b!192137 (= res!160430 (= (size!4385 (buf!4865 thiss!1204)) (size!4385 (buf!4865 (_2!8951 lt!298818)))))))

(declare-fun lt!298816 () Bool)

(declare-fun appendBit!0 (BitStream!7878 Bool) tuple2!16612)

(assert (=> b!192137 (= lt!298818 (appendBit!0 thiss!1204 lt!298816))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!298811 () (_ BitVec 64))

(assert (=> b!192137 (= lt!298816 (not (= (bvand v!189 lt!298811) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!192137 (= lt!298811 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!192138 () Bool)

(declare-fun e!132404 () Bool)

(declare-datatypes ((tuple2!16614 0))(
  ( (tuple2!16615 (_1!8952 BitStream!7878) (_2!8952 (_ BitVec 64))) )
))
(declare-fun lt!298802 () tuple2!16614)

(declare-datatypes ((tuple2!16616 0))(
  ( (tuple2!16617 (_1!8953 BitStream!7878) (_2!8953 BitStream!7878)) )
))
(declare-fun lt!298805 () tuple2!16616)

(assert (=> b!192138 (= e!132404 (= (_1!8952 lt!298802) (_2!8953 lt!298805)))))

(declare-fun b!192139 () Bool)

(declare-fun e!132407 () Bool)

(declare-fun e!132412 () Bool)

(assert (=> b!192139 (= e!132407 e!132412)))

(declare-fun res!160424 () Bool)

(assert (=> b!192139 (=> res!160424 e!132412)))

(declare-fun lt!298810 () tuple2!16616)

(declare-fun lt!298801 () BitStream!7878)

(assert (=> b!192139 (= res!160424 (not (= (_1!8953 lt!298810) lt!298801)))))

(declare-fun e!132406 () Bool)

(assert (=> b!192139 e!132406))

(declare-fun res!160428 () Bool)

(assert (=> b!192139 (=> (not res!160428) (not e!132406))))

(declare-fun lt!298806 () tuple2!16614)

(assert (=> b!192139 (= res!160428 (and (= (_2!8952 lt!298802) (_2!8952 lt!298806)) (= (_1!8952 lt!298802) (_1!8952 lt!298806))))))

(declare-fun lt!298797 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!298814 () Unit!13647)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13647)

(assert (=> b!192139 (= lt!298814 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8953 lt!298805) nBits!348 i!590 lt!298797))))

(declare-fun lt!298820 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16614)

(assert (=> b!192139 (= lt!298806 (readNBitsLSBFirstsLoopPure!0 lt!298801 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298820))))

(declare-fun withMovedBitIndex!0 (BitStream!7878 (_ BitVec 64)) BitStream!7878)

(assert (=> b!192139 (= lt!298801 (withMovedBitIndex!0 (_1!8953 lt!298805) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!192140 () Bool)

(declare-fun e!132408 () Bool)

(assert (=> b!192140 (= e!132408 e!132402)))

(declare-fun res!160446 () Bool)

(assert (=> b!192140 (=> (not res!160446) (not e!132402))))

(declare-fun lt!298804 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!192140 (= res!160446 (validate_offset_bits!1 ((_ sign_extend 32) (size!4385 (buf!4865 thiss!1204))) ((_ sign_extend 32) (currentByte!9149 thiss!1204)) ((_ sign_extend 32) (currentBit!9144 thiss!1204)) lt!298804))))

(assert (=> b!192140 (= lt!298804 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!192141 () Bool)

(declare-fun res!160445 () Bool)

(declare-fun e!132413 () Bool)

(assert (=> b!192141 (=> (not res!160445) (not e!132413))))

(declare-fun isPrefixOf!0 (BitStream!7878 BitStream!7878) Bool)

(assert (=> b!192141 (= res!160445 (isPrefixOf!0 thiss!1204 (_2!8951 lt!298818)))))

(declare-fun b!192142 () Bool)

(declare-fun res!160440 () Bool)

(assert (=> b!192142 (=> res!160440 e!132412)))

(assert (=> b!192142 (= res!160440 (not (= (bitIndex!0 (size!4385 (buf!4865 (_1!8952 lt!298802))) (currentByte!9149 (_1!8952 lt!298802)) (currentBit!9144 (_1!8952 lt!298802))) (bitIndex!0 (size!4385 (buf!4865 (_2!8953 lt!298805))) (currentByte!9149 (_2!8953 lt!298805)) (currentBit!9144 (_2!8953 lt!298805))))))))

(declare-fun b!192143 () Bool)

(declare-fun e!132416 () Bool)

(assert (=> b!192143 (= e!132416 e!132407)))

(declare-fun res!160437 () Bool)

(assert (=> b!192143 (=> res!160437 e!132407)))

(declare-fun lt!298822 () tuple2!16614)

(assert (=> b!192143 (= res!160437 (not (= (_1!8952 lt!298822) (_2!8953 lt!298810))))))

(assert (=> b!192143 (= lt!298822 (readNBitsLSBFirstsLoopPure!0 (_1!8953 lt!298810) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298820))))

(declare-fun lt!298825 () tuple2!16612)

(declare-fun lt!298809 () (_ BitVec 64))

(assert (=> b!192143 (validate_offset_bits!1 ((_ sign_extend 32) (size!4385 (buf!4865 (_2!8951 lt!298825)))) ((_ sign_extend 32) (currentByte!9149 (_2!8951 lt!298818))) ((_ sign_extend 32) (currentBit!9144 (_2!8951 lt!298818))) lt!298809)))

(declare-fun lt!298798 () Unit!13647)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7878 array!9946 (_ BitVec 64)) Unit!13647)

(assert (=> b!192143 (= lt!298798 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8951 lt!298818) (buf!4865 (_2!8951 lt!298825)) lt!298809))))

(assert (=> b!192143 (= lt!298809 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16618 0))(
  ( (tuple2!16619 (_1!8954 BitStream!7878) (_2!8954 Bool)) )
))
(declare-fun lt!298821 () tuple2!16618)

(assert (=> b!192143 (= lt!298820 (bvor lt!298797 (ite (_2!8954 lt!298821) lt!298811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!192143 (= lt!298802 (readNBitsLSBFirstsLoopPure!0 (_1!8953 lt!298805) nBits!348 i!590 lt!298797))))

(assert (=> b!192143 (validate_offset_bits!1 ((_ sign_extend 32) (size!4385 (buf!4865 (_2!8951 lt!298825)))) ((_ sign_extend 32) (currentByte!9149 thiss!1204)) ((_ sign_extend 32) (currentBit!9144 thiss!1204)) lt!298804)))

(declare-fun lt!298807 () Unit!13647)

(assert (=> b!192143 (= lt!298807 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4865 (_2!8951 lt!298825)) lt!298804))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!192143 (= lt!298797 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!192143 (= (_2!8954 lt!298821) lt!298816)))

(declare-fun readBitPure!0 (BitStream!7878) tuple2!16618)

(assert (=> b!192143 (= lt!298821 (readBitPure!0 (_1!8953 lt!298805)))))

(declare-fun reader!0 (BitStream!7878 BitStream!7878) tuple2!16616)

(assert (=> b!192143 (= lt!298810 (reader!0 (_2!8951 lt!298818) (_2!8951 lt!298825)))))

(assert (=> b!192143 (= lt!298805 (reader!0 thiss!1204 (_2!8951 lt!298825)))))

(declare-fun e!132415 () Bool)

(assert (=> b!192143 e!132415))

(declare-fun res!160431 () Bool)

(assert (=> b!192143 (=> (not res!160431) (not e!132415))))

(declare-fun lt!298813 () tuple2!16618)

(declare-fun lt!298803 () tuple2!16618)

(assert (=> b!192143 (= res!160431 (= (bitIndex!0 (size!4385 (buf!4865 (_1!8954 lt!298813))) (currentByte!9149 (_1!8954 lt!298813)) (currentBit!9144 (_1!8954 lt!298813))) (bitIndex!0 (size!4385 (buf!4865 (_1!8954 lt!298803))) (currentByte!9149 (_1!8954 lt!298803)) (currentBit!9144 (_1!8954 lt!298803)))))))

(declare-fun lt!298819 () Unit!13647)

(declare-fun lt!298799 () BitStream!7878)

(declare-fun readBitPrefixLemma!0 (BitStream!7878 BitStream!7878) Unit!13647)

(assert (=> b!192143 (= lt!298819 (readBitPrefixLemma!0 lt!298799 (_2!8951 lt!298825)))))

(assert (=> b!192143 (= lt!298803 (readBitPure!0 (BitStream!7879 (buf!4865 (_2!8951 lt!298825)) (currentByte!9149 thiss!1204) (currentBit!9144 thiss!1204))))))

(assert (=> b!192143 (= lt!298813 (readBitPure!0 lt!298799))))

(declare-fun e!132410 () Bool)

(assert (=> b!192143 e!132410))

(declare-fun res!160442 () Bool)

(assert (=> b!192143 (=> (not res!160442) (not e!132410))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192143 (= res!160442 (invariant!0 (currentBit!9144 thiss!1204) (currentByte!9149 thiss!1204) (size!4385 (buf!4865 (_2!8951 lt!298818)))))))

(assert (=> b!192143 (= lt!298799 (BitStream!7879 (buf!4865 (_2!8951 lt!298818)) (currentByte!9149 thiss!1204) (currentBit!9144 thiss!1204)))))

(declare-fun b!192144 () Bool)

(declare-fun res!160441 () Bool)

(assert (=> b!192144 (=> res!160441 e!132416)))

(assert (=> b!192144 (= res!160441 (not (isPrefixOf!0 (_2!8951 lt!298818) (_2!8951 lt!298825))))))

(declare-fun b!192145 () Bool)

(declare-fun res!160425 () Bool)

(assert (=> b!192145 (=> (not res!160425) (not e!132406))))

(declare-fun lt!298823 () (_ BitVec 64))

(assert (=> b!192145 (= res!160425 (= (_1!8953 lt!298805) (withMovedBitIndex!0 (_2!8953 lt!298805) (bvsub lt!298800 lt!298823))))))

(declare-fun b!192146 () Bool)

(assert (=> b!192146 (= e!132403 e!132416)))

(declare-fun res!160439 () Bool)

(assert (=> b!192146 (=> res!160439 e!132416)))

(assert (=> b!192146 (= res!160439 (not (= lt!298823 (bvsub (bvsub (bvadd lt!298815 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!192146 (= lt!298823 (bitIndex!0 (size!4385 (buf!4865 (_2!8951 lt!298825))) (currentByte!9149 (_2!8951 lt!298825)) (currentBit!9144 (_2!8951 lt!298825))))))

(assert (=> b!192146 (isPrefixOf!0 thiss!1204 (_2!8951 lt!298825))))

(declare-fun lt!298824 () Unit!13647)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7878 BitStream!7878 BitStream!7878) Unit!13647)

(assert (=> b!192146 (= lt!298824 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8951 lt!298818) (_2!8951 lt!298825)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7878 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16612)

(assert (=> b!192146 (= lt!298825 (appendBitsLSBFirstLoopTR!0 (_2!8951 lt!298818) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!192147 () Bool)

(declare-fun res!160432 () Bool)

(assert (=> b!192147 (=> res!160432 e!132416)))

(assert (=> b!192147 (= res!160432 (not (invariant!0 (currentBit!9144 (_2!8951 lt!298825)) (currentByte!9149 (_2!8951 lt!298825)) (size!4385 (buf!4865 (_2!8951 lt!298825))))))))

(declare-fun res!160434 () Bool)

(assert (=> start!41272 (=> (not res!160434) (not e!132408))))

(assert (=> start!41272 (= res!160434 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41272 e!132408))

(assert (=> start!41272 true))

(declare-fun e!132409 () Bool)

(declare-fun inv!12 (BitStream!7878) Bool)

(assert (=> start!41272 (and (inv!12 thiss!1204) e!132409)))

(declare-fun b!192148 () Bool)

(assert (=> b!192148 (= e!132410 (invariant!0 (currentBit!9144 thiss!1204) (currentByte!9149 thiss!1204) (size!4385 (buf!4865 (_2!8951 lt!298825)))))))

(declare-fun b!192149 () Bool)

(declare-fun res!160444 () Bool)

(assert (=> b!192149 (=> (not res!160444) (not e!132402))))

(assert (=> b!192149 (= res!160444 (invariant!0 (currentBit!9144 thiss!1204) (currentByte!9149 thiss!1204) (size!4385 (buf!4865 thiss!1204))))))

(declare-fun b!192150 () Bool)

(declare-fun e!132414 () Bool)

(declare-fun lt!298817 () tuple2!16618)

(declare-fun lt!298812 () (_ BitVec 64))

(assert (=> b!192150 (= e!132414 (= (bitIndex!0 (size!4385 (buf!4865 (_1!8954 lt!298817))) (currentByte!9149 (_1!8954 lt!298817)) (currentBit!9144 (_1!8954 lt!298817))) lt!298812))))

(declare-fun b!192151 () Bool)

(assert (=> b!192151 (= e!132406 (and (= lt!298800 (bvsub lt!298815 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8953 lt!298810) lt!298801)) (= (_2!8952 lt!298802) (_2!8952 lt!298822)))))))

(declare-fun b!192152 () Bool)

(assert (=> b!192152 (= e!132405 e!132413)))

(declare-fun res!160426 () Bool)

(assert (=> b!192152 (=> (not res!160426) (not e!132413))))

(declare-fun lt!298808 () (_ BitVec 64))

(assert (=> b!192152 (= res!160426 (= lt!298812 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298808)))))

(assert (=> b!192152 (= lt!298812 (bitIndex!0 (size!4385 (buf!4865 (_2!8951 lt!298818))) (currentByte!9149 (_2!8951 lt!298818)) (currentBit!9144 (_2!8951 lt!298818))))))

(assert (=> b!192152 (= lt!298808 (bitIndex!0 (size!4385 (buf!4865 thiss!1204)) (currentByte!9149 thiss!1204) (currentBit!9144 thiss!1204)))))

(declare-fun b!192153 () Bool)

(assert (=> b!192153 (= e!132415 (= (_2!8954 lt!298813) (_2!8954 lt!298803)))))

(declare-fun b!192154 () Bool)

(assert (=> b!192154 (= e!132412 true)))

(assert (=> b!192154 e!132404))

(declare-fun res!160438 () Bool)

(assert (=> b!192154 (=> (not res!160438) (not e!132404))))

(assert (=> b!192154 (= res!160438 (= (size!4385 (buf!4865 thiss!1204)) (size!4385 (buf!4865 (_2!8951 lt!298825)))))))

(declare-fun b!192155 () Bool)

(declare-fun res!160423 () Bool)

(assert (=> b!192155 (=> res!160423 e!132416)))

(assert (=> b!192155 (= res!160423 (or (not (= (size!4385 (buf!4865 (_2!8951 lt!298825))) (size!4385 (buf!4865 thiss!1204)))) (not (= lt!298823 (bvsub (bvadd lt!298800 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!192156 () Bool)

(declare-fun res!160433 () Bool)

(assert (=> b!192156 (=> (not res!160433) (not e!132402))))

(assert (=> b!192156 (= res!160433 (not (= i!590 nBits!348)))))

(declare-fun b!192157 () Bool)

(assert (=> b!192157 (= e!132413 e!132414)))

(declare-fun res!160427 () Bool)

(assert (=> b!192157 (=> (not res!160427) (not e!132414))))

(assert (=> b!192157 (= res!160427 (and (= (_2!8954 lt!298817) lt!298816) (= (_1!8954 lt!298817) (_2!8951 lt!298818))))))

(declare-fun readerFrom!0 (BitStream!7878 (_ BitVec 32) (_ BitVec 32)) BitStream!7878)

(assert (=> b!192157 (= lt!298817 (readBitPure!0 (readerFrom!0 (_2!8951 lt!298818) (currentBit!9144 thiss!1204) (currentByte!9149 thiss!1204))))))

(declare-fun b!192158 () Bool)

(declare-fun res!160429 () Bool)

(assert (=> b!192158 (=> res!160429 e!132416)))

(assert (=> b!192158 (= res!160429 (not (isPrefixOf!0 thiss!1204 (_2!8951 lt!298818))))))

(declare-fun b!192159 () Bool)

(declare-fun res!160436 () Bool)

(assert (=> b!192159 (=> (not res!160436) (not e!132406))))

(assert (=> b!192159 (= res!160436 (= (_1!8953 lt!298810) (withMovedBitIndex!0 (_2!8953 lt!298810) (bvsub lt!298815 lt!298823))))))

(declare-fun b!192160 () Bool)

(declare-fun array_inv!4126 (array!9946) Bool)

(assert (=> b!192160 (= e!132409 (array_inv!4126 (buf!4865 thiss!1204)))))

(declare-fun b!192161 () Bool)

(declare-fun res!160443 () Bool)

(assert (=> b!192161 (=> (not res!160443) (not e!132404))))

(assert (=> b!192161 (= res!160443 (= (_2!8952 lt!298802) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (= (and start!41272 res!160434) b!192140))

(assert (= (and b!192140 res!160446) b!192149))

(assert (= (and b!192149 res!160444) b!192156))

(assert (= (and b!192156 res!160433) b!192137))

(assert (= (and b!192137 res!160430) b!192152))

(assert (= (and b!192152 res!160426) b!192141))

(assert (= (and b!192141 res!160445) b!192157))

(assert (= (and b!192157 res!160427) b!192150))

(assert (= (and b!192137 (not res!160435)) b!192146))

(assert (= (and b!192146 (not res!160439)) b!192147))

(assert (= (and b!192147 (not res!160432)) b!192155))

(assert (= (and b!192155 (not res!160423)) b!192144))

(assert (= (and b!192144 (not res!160441)) b!192158))

(assert (= (and b!192158 (not res!160429)) b!192143))

(assert (= (and b!192143 res!160442) b!192148))

(assert (= (and b!192143 res!160431) b!192153))

(assert (= (and b!192143 (not res!160437)) b!192139))

(assert (= (and b!192139 res!160428) b!192145))

(assert (= (and b!192145 res!160425) b!192159))

(assert (= (and b!192159 res!160436) b!192151))

(assert (= (and b!192139 (not res!160424)) b!192142))

(assert (= (and b!192142 (not res!160440)) b!192154))

(assert (= (and b!192154 res!160438) b!192161))

(assert (= (and b!192161 res!160443) b!192138))

(assert (= start!41272 b!192160))

(declare-fun m!298271 () Bool)

(assert (=> b!192141 m!298271))

(declare-fun m!298273 () Bool)

(assert (=> b!192161 m!298273))

(declare-fun m!298275 () Bool)

(assert (=> b!192144 m!298275))

(declare-fun m!298277 () Bool)

(assert (=> b!192147 m!298277))

(declare-fun m!298279 () Bool)

(assert (=> b!192149 m!298279))

(declare-fun m!298281 () Bool)

(assert (=> b!192139 m!298281))

(declare-fun m!298283 () Bool)

(assert (=> b!192139 m!298283))

(declare-fun m!298285 () Bool)

(assert (=> b!192139 m!298285))

(declare-fun m!298287 () Bool)

(assert (=> b!192146 m!298287))

(declare-fun m!298289 () Bool)

(assert (=> b!192146 m!298289))

(declare-fun m!298291 () Bool)

(assert (=> b!192146 m!298291))

(declare-fun m!298293 () Bool)

(assert (=> b!192146 m!298293))

(assert (=> b!192158 m!298271))

(declare-fun m!298295 () Bool)

(assert (=> b!192160 m!298295))

(declare-fun m!298297 () Bool)

(assert (=> start!41272 m!298297))

(declare-fun m!298299 () Bool)

(assert (=> b!192150 m!298299))

(declare-fun m!298301 () Bool)

(assert (=> b!192140 m!298301))

(declare-fun m!298303 () Bool)

(assert (=> b!192157 m!298303))

(assert (=> b!192157 m!298303))

(declare-fun m!298305 () Bool)

(assert (=> b!192157 m!298305))

(declare-fun m!298307 () Bool)

(assert (=> b!192159 m!298307))

(declare-fun m!298309 () Bool)

(assert (=> b!192148 m!298309))

(declare-fun m!298311 () Bool)

(assert (=> b!192143 m!298311))

(declare-fun m!298313 () Bool)

(assert (=> b!192143 m!298313))

(declare-fun m!298315 () Bool)

(assert (=> b!192143 m!298315))

(declare-fun m!298317 () Bool)

(assert (=> b!192143 m!298317))

(declare-fun m!298319 () Bool)

(assert (=> b!192143 m!298319))

(declare-fun m!298321 () Bool)

(assert (=> b!192143 m!298321))

(declare-fun m!298323 () Bool)

(assert (=> b!192143 m!298323))

(declare-fun m!298325 () Bool)

(assert (=> b!192143 m!298325))

(declare-fun m!298327 () Bool)

(assert (=> b!192143 m!298327))

(declare-fun m!298329 () Bool)

(assert (=> b!192143 m!298329))

(declare-fun m!298331 () Bool)

(assert (=> b!192143 m!298331))

(declare-fun m!298333 () Bool)

(assert (=> b!192143 m!298333))

(declare-fun m!298335 () Bool)

(assert (=> b!192143 m!298335))

(declare-fun m!298337 () Bool)

(assert (=> b!192143 m!298337))

(declare-fun m!298339 () Bool)

(assert (=> b!192143 m!298339))

(declare-fun m!298341 () Bool)

(assert (=> b!192143 m!298341))

(declare-fun m!298343 () Bool)

(assert (=> b!192145 m!298343))

(declare-fun m!298345 () Bool)

(assert (=> b!192142 m!298345))

(declare-fun m!298347 () Bool)

(assert (=> b!192142 m!298347))

(declare-fun m!298349 () Bool)

(assert (=> b!192137 m!298349))

(declare-fun m!298351 () Bool)

(assert (=> b!192137 m!298351))

(declare-fun m!298353 () Bool)

(assert (=> b!192137 m!298353))

(assert (=> b!192152 m!298349))

(assert (=> b!192152 m!298351))

(check-sat (not start!41272) (not b!192160) (not b!192144) (not b!192161) (not b!192150) (not b!192152) (not b!192139) (not b!192148) (not b!192141) (not b!192143) (not b!192149) (not b!192140) (not b!192159) (not b!192137) (not b!192146) (not b!192158) (not b!192157) (not b!192145) (not b!192147) (not b!192142))
