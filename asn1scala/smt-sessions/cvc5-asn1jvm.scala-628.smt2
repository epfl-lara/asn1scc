; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17752 () Bool)

(assert start!17752)

(declare-fun b!85836 () Bool)

(declare-fun res!70466 () Bool)

(declare-fun e!57139 () Bool)

(assert (=> b!85836 (=> (not res!70466) (not e!57139))))

(declare-datatypes ((array!4077 0))(
  ( (array!4078 (arr!2478 (Array (_ BitVec 32) (_ BitVec 8))) (size!1841 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3244 0))(
  ( (BitStream!3245 (buf!2231 array!4077) (currentByte!4437 (_ BitVec 32)) (currentBit!4432 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3244)

(declare-datatypes ((Unit!5698 0))(
  ( (Unit!5699) )
))
(declare-datatypes ((tuple2!7294 0))(
  ( (tuple2!7295 (_1!3862 Unit!5698) (_2!3862 BitStream!3244)) )
))
(declare-fun lt!134913 () tuple2!7294)

(declare-fun isPrefixOf!0 (BitStream!3244 BitStream!3244) Bool)

(assert (=> b!85836 (= res!70466 (isPrefixOf!0 thiss!1152 (_2!3862 lt!134913)))))

(declare-fun b!85837 () Bool)

(declare-fun e!57144 () Bool)

(assert (=> b!85837 (= e!57144 e!57139)))

(declare-fun res!70467 () Bool)

(assert (=> b!85837 (=> (not res!70467) (not e!57139))))

(declare-fun lt!134917 () (_ BitVec 64))

(declare-fun lt!134916 () (_ BitVec 64))

(assert (=> b!85837 (= res!70467 (= lt!134917 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134916)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85837 (= lt!134917 (bitIndex!0 (size!1841 (buf!2231 (_2!3862 lt!134913))) (currentByte!4437 (_2!3862 lt!134913)) (currentBit!4432 (_2!3862 lt!134913))))))

(declare-fun b!85838 () Bool)

(declare-fun res!70472 () Bool)

(declare-fun e!57142 () Bool)

(assert (=> b!85838 (=> res!70472 e!57142)))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!85838 (= res!70472 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!85839 () Bool)

(assert (=> b!85839 (= e!57142 true)))

(declare-datatypes ((tuple3!382 0))(
  ( (tuple3!383 (_1!3863 Unit!5698) (_2!3863 BitStream!3244) (_3!215 (_ BitVec 32))) )
))
(declare-fun lt!134915 () tuple3!382)

(declare-fun thiss!1151 () BitStream!3244)

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3244 (_ BitVec 64) BitStream!3244 (_ BitVec 32)) tuple3!382)

(assert (=> b!85839 (= lt!134915 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!3862 lt!134913) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!85840 () Bool)

(declare-fun e!57138 () Bool)

(declare-datatypes ((tuple2!7296 0))(
  ( (tuple2!7297 (_1!3864 BitStream!3244) (_2!3864 Bool)) )
))
(declare-fun lt!134919 () tuple2!7296)

(assert (=> b!85840 (= e!57138 (= (bitIndex!0 (size!1841 (buf!2231 (_1!3864 lt!134919))) (currentByte!4437 (_1!3864 lt!134919)) (currentBit!4432 (_1!3864 lt!134919))) lt!134917))))

(declare-fun b!85841 () Bool)

(declare-fun res!70477 () Bool)

(declare-fun e!57141 () Bool)

(assert (=> b!85841 (=> (not res!70477) (not e!57141))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85841 (= res!70477 (invariant!0 (currentBit!4432 thiss!1151) (currentByte!4437 thiss!1151) (size!1841 (buf!2231 thiss!1151))))))

(declare-fun b!85842 () Bool)

(declare-fun res!70474 () Bool)

(assert (=> b!85842 (=> (not res!70474) (not e!57141))))

(assert (=> b!85842 (= res!70474 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun res!70463 () Bool)

(assert (=> start!17752 (=> (not res!70463) (not e!57141))))

(assert (=> start!17752 (= res!70463 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17752 e!57141))

(declare-fun e!57146 () Bool)

(declare-fun inv!12 (BitStream!3244) Bool)

(assert (=> start!17752 (and (inv!12 thiss!1152) e!57146)))

(declare-fun e!57140 () Bool)

(assert (=> start!17752 (and (inv!12 thiss!1151) e!57140)))

(assert (=> start!17752 true))

(declare-fun b!85843 () Bool)

(declare-fun e!57147 () Bool)

(assert (=> b!85843 (= e!57141 e!57147)))

(declare-fun res!70469 () Bool)

(assert (=> b!85843 (=> (not res!70469) (not e!57147))))

(declare-fun lt!134918 () (_ BitVec 64))

(assert (=> b!85843 (= res!70469 (= lt!134916 (bvadd lt!134918 ((_ sign_extend 32) i!576))))))

(assert (=> b!85843 (= lt!134916 (bitIndex!0 (size!1841 (buf!2231 thiss!1152)) (currentByte!4437 thiss!1152) (currentBit!4432 thiss!1152)))))

(assert (=> b!85843 (= lt!134918 (bitIndex!0 (size!1841 (buf!2231 thiss!1151)) (currentByte!4437 thiss!1151) (currentBit!4432 thiss!1151)))))

(declare-fun b!85844 () Bool)

(assert (=> b!85844 (= e!57147 (not e!57142))))

(declare-fun res!70464 () Bool)

(assert (=> b!85844 (=> res!70464 e!57142)))

(assert (=> b!85844 (= res!70464 (not (invariant!0 (currentBit!4432 (_2!3862 lt!134913)) (currentByte!4437 (_2!3862 lt!134913)) (size!1841 (buf!2231 (_2!3862 lt!134913))))))))

(assert (=> b!85844 e!57144))

(declare-fun res!70470 () Bool)

(assert (=> b!85844 (=> (not res!70470) (not e!57144))))

(assert (=> b!85844 (= res!70470 (= (size!1841 (buf!2231 thiss!1152)) (size!1841 (buf!2231 (_2!3862 lt!134913)))))))

(declare-fun lt!134914 () Bool)

(declare-fun appendBit!0 (BitStream!3244 Bool) tuple2!7294)

(assert (=> b!85844 (= lt!134913 (appendBit!0 thiss!1152 lt!134914))))

(assert (=> b!85844 (= lt!134914 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85845 () Bool)

(declare-fun res!70471 () Bool)

(assert (=> b!85845 (=> (not res!70471) (not e!57147))))

(assert (=> b!85845 (= res!70471 (bvslt i!576 nBits!336))))

(declare-fun b!85846 () Bool)

(assert (=> b!85846 (= e!57139 e!57138)))

(declare-fun res!70473 () Bool)

(assert (=> b!85846 (=> (not res!70473) (not e!57138))))

(assert (=> b!85846 (= res!70473 (and (= (_2!3864 lt!134919) lt!134914) (= (_1!3864 lt!134919) (_2!3862 lt!134913))))))

(declare-fun readBitPure!0 (BitStream!3244) tuple2!7296)

(declare-fun readerFrom!0 (BitStream!3244 (_ BitVec 32) (_ BitVec 32)) BitStream!3244)

(assert (=> b!85846 (= lt!134919 (readBitPure!0 (readerFrom!0 (_2!3862 lt!134913) (currentBit!4432 thiss!1152) (currentByte!4437 thiss!1152))))))

(declare-fun b!85847 () Bool)

(declare-fun res!70476 () Bool)

(assert (=> b!85847 (=> (not res!70476) (not e!57141))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85847 (= res!70476 (validate_offset_bits!1 ((_ sign_extend 32) (size!1841 (buf!2231 thiss!1151))) ((_ sign_extend 32) (currentByte!4437 thiss!1151)) ((_ sign_extend 32) (currentBit!4432 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85848 () Bool)

(declare-fun res!70468 () Bool)

(assert (=> b!85848 (=> (not res!70468) (not e!57141))))

(assert (=> b!85848 (= res!70468 (and (bvsle i!576 nBits!336) (= (size!1841 (buf!2231 thiss!1152)) (size!1841 (buf!2231 thiss!1151)))))))

(declare-fun b!85849 () Bool)

(declare-fun array_inv!1687 (array!4077) Bool)

(assert (=> b!85849 (= e!57146 (array_inv!1687 (buf!2231 thiss!1152)))))

(declare-fun b!85850 () Bool)

(declare-fun res!70475 () Bool)

(assert (=> b!85850 (=> (not res!70475) (not e!57147))))

(assert (=> b!85850 (= res!70475 (validate_offset_bits!1 ((_ sign_extend 32) (size!1841 (buf!2231 thiss!1152))) ((_ sign_extend 32) (currentByte!4437 thiss!1152)) ((_ sign_extend 32) (currentBit!4432 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!85851 () Bool)

(declare-fun res!70465 () Bool)

(assert (=> b!85851 (=> (not res!70465) (not e!57141))))

(assert (=> b!85851 (= res!70465 (invariant!0 (currentBit!4432 thiss!1152) (currentByte!4437 thiss!1152) (size!1841 (buf!2231 thiss!1152))))))

(declare-fun b!85852 () Bool)

(assert (=> b!85852 (= e!57140 (array_inv!1687 (buf!2231 thiss!1151)))))

(assert (= (and start!17752 res!70463) b!85847))

(assert (= (and b!85847 res!70476) b!85841))

(assert (= (and b!85841 res!70477) b!85842))

(assert (= (and b!85842 res!70474) b!85851))

(assert (= (and b!85851 res!70465) b!85848))

(assert (= (and b!85848 res!70468) b!85843))

(assert (= (and b!85843 res!70469) b!85850))

(assert (= (and b!85850 res!70475) b!85845))

(assert (= (and b!85845 res!70471) b!85844))

(assert (= (and b!85844 res!70470) b!85837))

(assert (= (and b!85837 res!70467) b!85836))

(assert (= (and b!85836 res!70466) b!85846))

(assert (= (and b!85846 res!70473) b!85840))

(assert (= (and b!85844 (not res!70464)) b!85838))

(assert (= (and b!85838 (not res!70472)) b!85839))

(assert (= start!17752 b!85849))

(assert (= start!17752 b!85852))

(declare-fun m!131873 () Bool)

(assert (=> b!85837 m!131873))

(declare-fun m!131875 () Bool)

(assert (=> b!85839 m!131875))

(declare-fun m!131877 () Bool)

(assert (=> b!85841 m!131877))

(declare-fun m!131879 () Bool)

(assert (=> start!17752 m!131879))

(declare-fun m!131881 () Bool)

(assert (=> start!17752 m!131881))

(declare-fun m!131883 () Bool)

(assert (=> b!85843 m!131883))

(declare-fun m!131885 () Bool)

(assert (=> b!85843 m!131885))

(declare-fun m!131887 () Bool)

(assert (=> b!85851 m!131887))

(declare-fun m!131889 () Bool)

(assert (=> b!85836 m!131889))

(declare-fun m!131891 () Bool)

(assert (=> b!85840 m!131891))

(declare-fun m!131893 () Bool)

(assert (=> b!85844 m!131893))

(declare-fun m!131895 () Bool)

(assert (=> b!85844 m!131895))

(declare-fun m!131897 () Bool)

(assert (=> b!85850 m!131897))

(declare-fun m!131899 () Bool)

(assert (=> b!85846 m!131899))

(assert (=> b!85846 m!131899))

(declare-fun m!131901 () Bool)

(assert (=> b!85846 m!131901))

(declare-fun m!131903 () Bool)

(assert (=> b!85852 m!131903))

(declare-fun m!131905 () Bool)

(assert (=> b!85849 m!131905))

(declare-fun m!131907 () Bool)

(assert (=> b!85847 m!131907))

(push 1)

(assert (not b!85840))

(assert (not b!85849))

(assert (not b!85851))

(assert (not b!85846))

(assert (not b!85844))

(assert (not b!85839))

(assert (not b!85852))

(assert (not b!85847))

(assert (not b!85837))

