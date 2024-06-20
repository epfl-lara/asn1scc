; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52482 () Bool)

(assert start!52482)

(declare-fun b!242137 () Bool)

(declare-fun e!167866 () Bool)

(declare-datatypes ((array!13293 0))(
  ( (array!13294 (arr!6813 (Array (_ BitVec 32) (_ BitVec 8))) (size!5826 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10574 0))(
  ( (BitStream!10575 (buf!6292 array!13293) (currentByte!11655 (_ BitVec 32)) (currentBit!11650 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10574)

(declare-datatypes ((Unit!17735 0))(
  ( (Unit!17736) )
))
(declare-datatypes ((tuple2!20706 0))(
  ( (tuple2!20707 (_1!11275 Unit!17735) (_2!11275 BitStream!10574)) )
))
(declare-fun lt!377554 () tuple2!20706)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242137 (= e!167866 (invariant!0 (currentBit!11650 thiss!1005) (currentByte!11655 thiss!1005) (size!5826 (buf!6292 (_2!11275 lt!377554)))))))

(declare-fun b!242138 () Bool)

(declare-fun res!202183 () Bool)

(declare-fun e!167868 () Bool)

(assert (=> b!242138 (=> (not res!202183) (not e!167868))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242138 (= res!202183 (validate_offset_bits!1 ((_ sign_extend 32) (size!5826 (buf!6292 thiss!1005))) ((_ sign_extend 32) (currentByte!11655 thiss!1005)) ((_ sign_extend 32) (currentBit!11650 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242139 () Bool)

(declare-fun e!167861 () Bool)

(declare-datatypes ((tuple2!20708 0))(
  ( (tuple2!20709 (_1!11276 BitStream!10574) (_2!11276 Bool)) )
))
(declare-fun lt!377564 () tuple2!20708)

(declare-fun lt!377559 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242139 (= e!167861 (= (bitIndex!0 (size!5826 (buf!6292 (_1!11276 lt!377564))) (currentByte!11655 (_1!11276 lt!377564)) (currentBit!11650 (_1!11276 lt!377564))) lt!377559))))

(declare-fun b!242140 () Bool)

(declare-fun e!167862 () Bool)

(assert (=> b!242140 (= e!167868 (not e!167862))))

(declare-fun res!202179 () Bool)

(assert (=> b!242140 (=> res!202179 e!167862)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242140 (= res!202179 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5826 (buf!6292 (_2!11275 lt!377554)))) ((_ sign_extend 32) (currentByte!11655 thiss!1005)) ((_ sign_extend 32) (currentBit!11650 thiss!1005)))))))

(assert (=> b!242140 e!167866))

(declare-fun res!202182 () Bool)

(assert (=> b!242140 (=> (not res!202182) (not e!167866))))

(declare-fun lt!377562 () tuple2!20706)

(declare-fun isPrefixOf!0 (BitStream!10574 BitStream!10574) Bool)

(assert (=> b!242140 (= res!202182 (isPrefixOf!0 thiss!1005 (_2!11275 lt!377562)))))

(declare-fun lt!377553 () Unit!17735)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10574 BitStream!10574 BitStream!10574) Unit!17735)

(assert (=> b!242140 (= lt!377553 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11275 lt!377554) (_2!11275 lt!377562)))))

(declare-fun e!167863 () Bool)

(assert (=> b!242140 e!167863))

(declare-fun res!202184 () Bool)

(assert (=> b!242140 (=> (not res!202184) (not e!167863))))

(assert (=> b!242140 (= res!202184 (= (size!5826 (buf!6292 (_2!11275 lt!377554))) (size!5826 (buf!6292 (_2!11275 lt!377562)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10574 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20706)

(assert (=> b!242140 (= lt!377562 (appendNBitsLoop!0 (_2!11275 lt!377554) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242140 (validate_offset_bits!1 ((_ sign_extend 32) (size!5826 (buf!6292 (_2!11275 lt!377554)))) ((_ sign_extend 32) (currentByte!11655 (_2!11275 lt!377554))) ((_ sign_extend 32) (currentBit!11650 (_2!11275 lt!377554))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377557 () Unit!17735)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10574 BitStream!10574 (_ BitVec 64) (_ BitVec 64)) Unit!17735)

(assert (=> b!242140 (= lt!377557 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11275 lt!377554) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167865 () Bool)

(assert (=> b!242140 e!167865))

(declare-fun res!202187 () Bool)

(assert (=> b!242140 (=> (not res!202187) (not e!167865))))

(assert (=> b!242140 (= res!202187 (= (size!5826 (buf!6292 thiss!1005)) (size!5826 (buf!6292 (_2!11275 lt!377554)))))))

(declare-fun appendBit!0 (BitStream!10574 Bool) tuple2!20706)

(assert (=> b!242140 (= lt!377554 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242141 () Bool)

(declare-fun e!167870 () Bool)

(assert (=> b!242141 (= e!167863 e!167870)))

(declare-fun res!202186 () Bool)

(assert (=> b!242141 (=> (not res!202186) (not e!167870))))

(declare-fun lt!377565 () (_ BitVec 64))

(assert (=> b!242141 (= res!202186 (= (bitIndex!0 (size!5826 (buf!6292 (_2!11275 lt!377562))) (currentByte!11655 (_2!11275 lt!377562)) (currentBit!11650 (_2!11275 lt!377562))) (bvadd (bitIndex!0 (size!5826 (buf!6292 (_2!11275 lt!377554))) (currentByte!11655 (_2!11275 lt!377554)) (currentBit!11650 (_2!11275 lt!377554))) lt!377565)))))

(assert (=> b!242141 (= lt!377565 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242142 () Bool)

(declare-fun e!167867 () Bool)

(assert (=> b!242142 (= e!167867 e!167861)))

(declare-fun res!202188 () Bool)

(assert (=> b!242142 (=> (not res!202188) (not e!167861))))

(assert (=> b!242142 (= res!202188 (and (= (_2!11276 lt!377564) bit!26) (= (_1!11276 lt!377564) (_2!11275 lt!377554))))))

(declare-fun readBitPure!0 (BitStream!10574) tuple2!20708)

(declare-fun readerFrom!0 (BitStream!10574 (_ BitVec 32) (_ BitVec 32)) BitStream!10574)

(assert (=> b!242142 (= lt!377564 (readBitPure!0 (readerFrom!0 (_2!11275 lt!377554) (currentBit!11650 thiss!1005) (currentByte!11655 thiss!1005))))))

(declare-fun res!202181 () Bool)

(assert (=> start!52482 (=> (not res!202181) (not e!167868))))

(assert (=> start!52482 (= res!202181 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52482 e!167868))

(assert (=> start!52482 true))

(declare-fun e!167869 () Bool)

(declare-fun inv!12 (BitStream!10574) Bool)

(assert (=> start!52482 (and (inv!12 thiss!1005) e!167869)))

(declare-fun b!242143 () Bool)

(declare-fun res!202190 () Bool)

(assert (=> b!242143 (=> (not res!202190) (not e!167870))))

(assert (=> b!242143 (= res!202190 (isPrefixOf!0 (_2!11275 lt!377554) (_2!11275 lt!377562)))))

(declare-fun b!242144 () Bool)

(declare-fun res!202191 () Bool)

(assert (=> b!242144 (=> (not res!202191) (not e!167868))))

(assert (=> b!242144 (= res!202191 (bvslt from!289 nBits!297))))

(declare-fun b!242145 () Bool)

(assert (=> b!242145 (= e!167862 true)))

(declare-fun lt!377560 () tuple2!20708)

(assert (=> b!242145 (= lt!377560 (readBitPure!0 (BitStream!10575 (buf!6292 (_2!11275 lt!377562)) (currentByte!11655 thiss!1005) (currentBit!11650 thiss!1005))))))

(declare-fun lt!377556 () tuple2!20708)

(assert (=> b!242145 (= lt!377556 (readBitPure!0 (BitStream!10575 (buf!6292 (_2!11275 lt!377554)) (currentByte!11655 thiss!1005) (currentBit!11650 thiss!1005))))))

(assert (=> b!242145 (invariant!0 (currentBit!11650 thiss!1005) (currentByte!11655 thiss!1005) (size!5826 (buf!6292 (_2!11275 lt!377562))))))

(declare-fun b!242146 () Bool)

(declare-fun res!202180 () Bool)

(assert (=> b!242146 (=> res!202180 e!167862)))

(declare-fun arrayBitRangesEq!0 (array!13293 array!13293 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242146 (= res!202180 (not (arrayBitRangesEq!0 (buf!6292 (_2!11275 lt!377554)) (buf!6292 (_2!11275 lt!377562)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5826 (buf!6292 (_2!11275 lt!377554))) (currentByte!11655 thiss!1005) (currentBit!11650 thiss!1005))))))))

(declare-fun b!242147 () Bool)

(declare-fun array_inv!5567 (array!13293) Bool)

(assert (=> b!242147 (= e!167869 (array_inv!5567 (buf!6292 thiss!1005)))))

(declare-fun b!242148 () Bool)

(assert (=> b!242148 (= e!167865 e!167867)))

(declare-fun res!202189 () Bool)

(assert (=> b!242148 (=> (not res!202189) (not e!167867))))

(declare-fun lt!377563 () (_ BitVec 64))

(assert (=> b!242148 (= res!202189 (= lt!377559 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377563)))))

(assert (=> b!242148 (= lt!377559 (bitIndex!0 (size!5826 (buf!6292 (_2!11275 lt!377554))) (currentByte!11655 (_2!11275 lt!377554)) (currentBit!11650 (_2!11275 lt!377554))))))

(assert (=> b!242148 (= lt!377563 (bitIndex!0 (size!5826 (buf!6292 thiss!1005)) (currentByte!11655 thiss!1005) (currentBit!11650 thiss!1005)))))

(declare-fun b!242149 () Bool)

(declare-fun res!202185 () Bool)

(assert (=> b!242149 (=> (not res!202185) (not e!167867))))

(assert (=> b!242149 (= res!202185 (isPrefixOf!0 thiss!1005 (_2!11275 lt!377554)))))

(declare-fun b!242150 () Bool)

(declare-fun lt!377555 () tuple2!20708)

(declare-datatypes ((tuple2!20710 0))(
  ( (tuple2!20711 (_1!11277 BitStream!10574) (_2!11277 BitStream!10574)) )
))
(declare-fun lt!377561 () tuple2!20710)

(assert (=> b!242150 (= e!167870 (not (or (not (_2!11276 lt!377555)) (not (= (_1!11276 lt!377555) (_2!11277 lt!377561))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10574 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20708)

(assert (=> b!242150 (= lt!377555 (checkBitsLoopPure!0 (_1!11277 lt!377561) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242150 (validate_offset_bits!1 ((_ sign_extend 32) (size!5826 (buf!6292 (_2!11275 lt!377562)))) ((_ sign_extend 32) (currentByte!11655 (_2!11275 lt!377554))) ((_ sign_extend 32) (currentBit!11650 (_2!11275 lt!377554))) lt!377565)))

(declare-fun lt!377558 () Unit!17735)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10574 array!13293 (_ BitVec 64)) Unit!17735)

(assert (=> b!242150 (= lt!377558 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11275 lt!377554) (buf!6292 (_2!11275 lt!377562)) lt!377565))))

(declare-fun reader!0 (BitStream!10574 BitStream!10574) tuple2!20710)

(assert (=> b!242150 (= lt!377561 (reader!0 (_2!11275 lt!377554) (_2!11275 lt!377562)))))

(assert (= (and start!52482 res!202181) b!242138))

(assert (= (and b!242138 res!202183) b!242144))

(assert (= (and b!242144 res!202191) b!242140))

(assert (= (and b!242140 res!202187) b!242148))

(assert (= (and b!242148 res!202189) b!242149))

(assert (= (and b!242149 res!202185) b!242142))

(assert (= (and b!242142 res!202188) b!242139))

(assert (= (and b!242140 res!202184) b!242141))

(assert (= (and b!242141 res!202186) b!242143))

(assert (= (and b!242143 res!202190) b!242150))

(assert (= (and b!242140 res!202182) b!242137))

(assert (= (and b!242140 (not res!202179)) b!242146))

(assert (= (and b!242146 (not res!202180)) b!242145))

(assert (= start!52482 b!242147))

(declare-fun m!364875 () Bool)

(assert (=> b!242143 m!364875))

(declare-fun m!364877 () Bool)

(assert (=> b!242140 m!364877))

(declare-fun m!364879 () Bool)

(assert (=> b!242140 m!364879))

(declare-fun m!364881 () Bool)

(assert (=> b!242140 m!364881))

(declare-fun m!364883 () Bool)

(assert (=> b!242140 m!364883))

(declare-fun m!364885 () Bool)

(assert (=> b!242140 m!364885))

(declare-fun m!364887 () Bool)

(assert (=> b!242140 m!364887))

(declare-fun m!364889 () Bool)

(assert (=> b!242140 m!364889))

(declare-fun m!364891 () Bool)

(assert (=> b!242148 m!364891))

(declare-fun m!364893 () Bool)

(assert (=> b!242148 m!364893))

(declare-fun m!364895 () Bool)

(assert (=> b!242138 m!364895))

(declare-fun m!364897 () Bool)

(assert (=> b!242146 m!364897))

(declare-fun m!364899 () Bool)

(assert (=> b!242146 m!364899))

(declare-fun m!364901 () Bool)

(assert (=> b!242137 m!364901))

(declare-fun m!364903 () Bool)

(assert (=> b!242149 m!364903))

(declare-fun m!364905 () Bool)

(assert (=> b!242142 m!364905))

(assert (=> b!242142 m!364905))

(declare-fun m!364907 () Bool)

(assert (=> b!242142 m!364907))

(declare-fun m!364909 () Bool)

(assert (=> b!242150 m!364909))

(declare-fun m!364911 () Bool)

(assert (=> b!242150 m!364911))

(declare-fun m!364913 () Bool)

(assert (=> b!242150 m!364913))

(declare-fun m!364915 () Bool)

(assert (=> b!242150 m!364915))

(declare-fun m!364917 () Bool)

(assert (=> b!242139 m!364917))

(declare-fun m!364919 () Bool)

(assert (=> b!242145 m!364919))

(declare-fun m!364921 () Bool)

(assert (=> b!242145 m!364921))

(declare-fun m!364923 () Bool)

(assert (=> b!242145 m!364923))

(declare-fun m!364925 () Bool)

(assert (=> start!52482 m!364925))

(declare-fun m!364927 () Bool)

(assert (=> b!242147 m!364927))

(declare-fun m!364929 () Bool)

(assert (=> b!242141 m!364929))

(assert (=> b!242141 m!364891))

(push 1)

