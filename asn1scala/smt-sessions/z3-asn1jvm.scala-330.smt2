; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7486 () Bool)

(assert start!7486)

(declare-datatypes ((array!1924 0))(
  ( (array!1925 (arr!1347 (Array (_ BitVec 32) (_ BitVec 8))) (size!860 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1924)

(declare-fun b!36571 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((BitStream!1488 0))(
  ( (BitStream!1489 (buf!1188 array!1924) (currentByte!2582 (_ BitVec 32)) (currentBit!2577 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3604 0))(
  ( (tuple2!3605 (_1!1889 BitStream!1488) (_2!1889 BitStream!1488)) )
))
(declare-fun lt!54902 () tuple2!3604)

(declare-datatypes ((Unit!2671 0))(
  ( (Unit!2672) )
))
(declare-datatypes ((tuple2!3606 0))(
  ( (tuple2!3607 (_1!1890 Unit!2671) (_2!1890 BitStream!1488)) )
))
(declare-fun lt!54893 () tuple2!3606)

(declare-fun e!24130 () Bool)

(declare-datatypes ((List!445 0))(
  ( (Nil!442) (Cons!441 (h!560 Bool) (t!1195 List!445)) )
))
(declare-fun head!282 (List!445) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1488 array!1924 (_ BitVec 64) (_ BitVec 64)) List!445)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1488 BitStream!1488 (_ BitVec 64)) List!445)

(assert (=> b!36571 (= e!24130 (= (head!282 (byteArrayBitContentToList!0 (_2!1890 lt!54893) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!282 (bitStreamReadBitsIntoList!0 (_2!1890 lt!54893) (_1!1889 lt!54902) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!36572 () Bool)

(declare-fun res!31177 () Bool)

(declare-fun e!24133 () Bool)

(assert (=> b!36572 (=> res!31177 e!24133)))

(declare-fun thiss!1379 () BitStream!1488)

(declare-fun lt!54886 () tuple2!3606)

(assert (=> b!36572 (= res!31177 (not (= (size!860 (buf!1188 thiss!1379)) (size!860 (buf!1188 (_2!1890 lt!54886))))))))

(declare-fun b!36573 () Bool)

(declare-fun e!24141 () Bool)

(declare-fun array_inv!797 (array!1924) Bool)

(assert (=> b!36573 (= e!24141 (array_inv!797 (buf!1188 thiss!1379)))))

(declare-fun res!31176 () Bool)

(declare-fun e!24129 () Bool)

(assert (=> start!7486 (=> (not res!31176) (not e!24129))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!7486 (= res!31176 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!860 srcBuffer!2))))))))

(assert (=> start!7486 e!24129))

(assert (=> start!7486 true))

(assert (=> start!7486 (array_inv!797 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1488) Bool)

(assert (=> start!7486 (and (inv!12 thiss!1379) e!24141)))

(declare-fun b!36574 () Bool)

(declare-fun res!31170 () Bool)

(assert (=> b!36574 (=> res!31170 e!24133)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!36574 (= res!31170 (not (invariant!0 (currentBit!2577 (_2!1890 lt!54886)) (currentByte!2582 (_2!1890 lt!54886)) (size!860 (buf!1188 (_2!1890 lt!54886))))))))

(declare-fun b!36575 () Bool)

(declare-fun e!24127 () Bool)

(declare-fun e!24135 () Bool)

(assert (=> b!36575 (= e!24127 e!24135)))

(declare-fun res!31178 () Bool)

(assert (=> b!36575 (=> res!31178 e!24135)))

(declare-fun isPrefixOf!0 (BitStream!1488 BitStream!1488) Bool)

(assert (=> b!36575 (= res!31178 (not (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!54886))))))

(assert (=> b!36575 (isPrefixOf!0 thiss!1379 (_2!1890 lt!54886))))

(declare-fun lt!54882 () Unit!2671)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1488 BitStream!1488 BitStream!1488) Unit!2671)

(assert (=> b!36575 (= lt!54882 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1890 lt!54893) (_2!1890 lt!54886)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1488 array!1924 (_ BitVec 64) (_ BitVec 64)) tuple2!3606)

(assert (=> b!36575 (= lt!54886 (appendBitsMSBFirstLoop!0 (_2!1890 lt!54893) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!36575 e!24130))

(declare-fun res!31172 () Bool)

(assert (=> b!36575 (=> (not res!31172) (not e!24130))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36575 (= res!31172 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54897 () Unit!2671)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1488 array!1924 (_ BitVec 64)) Unit!2671)

(assert (=> b!36575 (= lt!54897 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1188 (_2!1890 lt!54893)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1488 BitStream!1488) tuple2!3604)

(assert (=> b!36575 (= lt!54902 (reader!0 thiss!1379 (_2!1890 lt!54893)))))

(declare-fun b!36576 () Bool)

(declare-fun e!24131 () Bool)

(declare-fun e!24140 () Bool)

(assert (=> b!36576 (= e!24131 e!24140)))

(declare-fun res!31168 () Bool)

(assert (=> b!36576 (=> res!31168 e!24140)))

(assert (=> b!36576 (= res!31168 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!54896 () (_ BitVec 64))

(declare-fun lt!54891 () List!445)

(declare-fun lt!54894 () tuple2!3604)

(assert (=> b!36576 (= lt!54891 (bitStreamReadBitsIntoList!0 (_2!1890 lt!54886) (_1!1889 lt!54894) lt!54896))))

(declare-fun lt!54890 () List!445)

(declare-fun lt!54884 () tuple2!3604)

(assert (=> b!36576 (= lt!54890 (bitStreamReadBitsIntoList!0 (_2!1890 lt!54886) (_1!1889 lt!54884) (bvsub to!314 i!635)))))

(assert (=> b!36576 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!54896)))

(declare-fun lt!54903 () Unit!2671)

(assert (=> b!36576 (= lt!54903 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1890 lt!54893) (buf!1188 (_2!1890 lt!54886)) lt!54896))))

(assert (=> b!36576 (= lt!54894 (reader!0 (_2!1890 lt!54893) (_2!1890 lt!54886)))))

(assert (=> b!36576 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!54898 () Unit!2671)

(assert (=> b!36576 (= lt!54898 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1188 (_2!1890 lt!54886)) (bvsub to!314 i!635)))))

(assert (=> b!36576 (= lt!54884 (reader!0 thiss!1379 (_2!1890 lt!54886)))))

(declare-fun b!36577 () Bool)

(declare-fun res!31161 () Bool)

(assert (=> b!36577 (=> res!31161 e!24131)))

(assert (=> b!36577 (= res!31161 (not (invariant!0 (currentBit!2577 (_2!1890 lt!54893)) (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54893))))))))

(declare-fun b!36578 () Bool)

(declare-fun e!24137 () Bool)

(assert (=> b!36578 (= e!24137 e!24127)))

(declare-fun res!31169 () Bool)

(assert (=> b!36578 (=> res!31169 e!24127)))

(assert (=> b!36578 (= res!31169 (not (isPrefixOf!0 thiss!1379 (_2!1890 lt!54893))))))

(assert (=> b!36578 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!54896)))

(assert (=> b!36578 (= lt!54896 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54904 () Unit!2671)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1488 BitStream!1488 (_ BitVec 64) (_ BitVec 64)) Unit!2671)

(assert (=> b!36578 (= lt!54904 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1890 lt!54893) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1488 (_ BitVec 8) (_ BitVec 32)) tuple2!3606)

(assert (=> b!36578 (= lt!54893 (appendBitFromByte!0 thiss!1379 (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!36579 () Bool)

(declare-fun res!31173 () Bool)

(assert (=> b!36579 (=> res!31173 e!24131)))

(assert (=> b!36579 (= res!31173 (not (invariant!0 (currentBit!2577 (_2!1890 lt!54893)) (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54886))))))))

(declare-fun b!36580 () Bool)

(declare-fun res!31160 () Bool)

(assert (=> b!36580 (=> (not res!31160) (not e!24129))))

(assert (=> b!36580 (= res!31160 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 thiss!1379))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!36581 () Bool)

(declare-fun e!24128 () Bool)

(assert (=> b!36581 (= e!24140 e!24128)))

(declare-fun res!31162 () Bool)

(assert (=> b!36581 (=> res!31162 e!24128)))

(declare-fun lt!54883 () List!445)

(assert (=> b!36581 (= res!31162 (not (= lt!54883 lt!54891)))))

(assert (=> b!36581 (= lt!54891 lt!54883)))

(declare-fun tail!162 (List!445) List!445)

(assert (=> b!36581 (= lt!54883 (tail!162 lt!54890))))

(declare-fun lt!54887 () Unit!2671)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1488 BitStream!1488 BitStream!1488 BitStream!1488 (_ BitVec 64) List!445) Unit!2671)

(assert (=> b!36581 (= lt!54887 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1890 lt!54886) (_2!1890 lt!54886) (_1!1889 lt!54884) (_1!1889 lt!54894) (bvsub to!314 i!635) lt!54890))))

(declare-fun b!36582 () Bool)

(assert (=> b!36582 (= e!24133 e!24131)))

(declare-fun res!31167 () Bool)

(assert (=> b!36582 (=> res!31167 e!24131)))

(assert (=> b!36582 (= res!31167 (not (= (size!860 (buf!1188 (_2!1890 lt!54893))) (size!860 (buf!1188 (_2!1890 lt!54886))))))))

(declare-fun lt!54895 () (_ BitVec 64))

(declare-fun lt!54889 () (_ BitVec 64))

(assert (=> b!36582 (= lt!54895 (bvsub (bvsub (bvadd lt!54889 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!36582 (= lt!54889 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))))))

(assert (=> b!36582 (= (size!860 (buf!1188 (_2!1890 lt!54886))) (size!860 (buf!1188 thiss!1379)))))

(declare-fun b!36583 () Bool)

(assert (=> b!36583 (= e!24129 (not e!24137))))

(declare-fun res!31164 () Bool)

(assert (=> b!36583 (=> res!31164 e!24137)))

(assert (=> b!36583 (= res!31164 (bvsge i!635 to!314))))

(assert (=> b!36583 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54892 () Unit!2671)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1488) Unit!2671)

(assert (=> b!36583 (= lt!54892 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!54900 () (_ BitVec 64))

(assert (=> b!36583 (= lt!54900 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(declare-fun b!36584 () Bool)

(declare-fun e!24138 () Bool)

(declare-fun e!24142 () Bool)

(assert (=> b!36584 (= e!24138 e!24142)))

(declare-fun res!31166 () Bool)

(assert (=> b!36584 (=> res!31166 e!24142)))

(declare-fun lt!54901 () Bool)

(declare-fun lt!54899 () Bool)

(assert (=> b!36584 (= res!31166 (not (= lt!54901 lt!54899)))))

(declare-fun bitAt!0 (array!1924 (_ BitVec 64)) Bool)

(assert (=> b!36584 (= lt!54901 (bitAt!0 (buf!1188 (_2!1890 lt!54893)) lt!54900))))

(declare-fun b!36585 () Bool)

(declare-fun e!24134 () Bool)

(assert (=> b!36585 (= e!24134 e!24138)))

(declare-fun res!31163 () Bool)

(assert (=> b!36585 (=> res!31163 e!24138)))

(assert (=> b!36585 (= res!31163 (not (= (head!282 (byteArrayBitContentToList!0 (_2!1890 lt!54886) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!54899)))))

(assert (=> b!36585 (= lt!54899 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!36586 () Bool)

(assert (=> b!36586 (= e!24128 e!24134)))

(declare-fun res!31179 () Bool)

(assert (=> b!36586 (=> res!31179 e!24134)))

(declare-fun lt!54888 () Bool)

(assert (=> b!36586 (= res!31179 (not (= lt!54888 (bitAt!0 (buf!1188 (_1!1889 lt!54894)) lt!54900))))))

(assert (=> b!36586 (= lt!54888 (bitAt!0 (buf!1188 (_1!1889 lt!54884)) lt!54900))))

(declare-fun b!36587 () Bool)

(declare-fun e!24136 () Bool)

(assert (=> b!36587 (= e!24142 e!24136)))

(declare-fun res!31165 () Bool)

(assert (=> b!36587 (=> res!31165 e!24136)))

(declare-fun lt!54885 () Bool)

(assert (=> b!36587 (= res!31165 (not (= lt!54885 lt!54899)))))

(assert (=> b!36587 (= lt!54901 lt!54885)))

(assert (=> b!36587 (= lt!54885 (bitAt!0 (buf!1188 (_2!1890 lt!54886)) lt!54900))))

(declare-fun lt!54881 () Unit!2671)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1924 array!1924 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2671)

(assert (=> b!36587 (= lt!54881 (arrayBitRangesEqImpliesEq!0 (buf!1188 (_2!1890 lt!54893)) (buf!1188 (_2!1890 lt!54886)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54900 lt!54889))))

(declare-fun b!36588 () Bool)

(assert (=> b!36588 (= e!24135 e!24133)))

(declare-fun res!31174 () Bool)

(assert (=> b!36588 (=> res!31174 e!24133)))

(assert (=> b!36588 (= res!31174 (not (= lt!54895 (bvsub (bvadd lt!54900 to!314) i!635))))))

(assert (=> b!36588 (= lt!54895 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54886))) (currentByte!2582 (_2!1890 lt!54886)) (currentBit!2577 (_2!1890 lt!54886))))))

(declare-fun b!36589 () Bool)

(declare-fun res!31175 () Bool)

(assert (=> b!36589 (=> res!31175 e!24136)))

(declare-datatypes ((tuple2!3608 0))(
  ( (tuple2!3609 (_1!1891 BitStream!1488) (_2!1891 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1488) tuple2!3608)

(assert (=> b!36589 (= res!31175 (not (= (_2!1891 (readBitPure!0 (_1!1889 lt!54884))) lt!54899)))))

(declare-fun b!36590 () Bool)

(assert (=> b!36590 (= e!24136 (not (= lt!54890 Nil!442)))))

(declare-fun b!36591 () Bool)

(declare-fun res!31159 () Bool)

(assert (=> b!36591 (=> res!31159 e!24140)))

(declare-fun length!171 (List!445) Int)

(assert (=> b!36591 (= res!31159 (<= (length!171 lt!54890) 0))))

(declare-fun b!36592 () Bool)

(declare-fun res!31171 () Bool)

(assert (=> b!36592 (=> res!31171 e!24134)))

(assert (=> b!36592 (= res!31171 (not (= (head!282 lt!54890) lt!54888)))))

(assert (= (and start!7486 res!31176) b!36580))

(assert (= (and b!36580 res!31160) b!36583))

(assert (= (and b!36583 (not res!31164)) b!36578))

(assert (= (and b!36578 (not res!31169)) b!36575))

(assert (= (and b!36575 res!31172) b!36571))

(assert (= (and b!36575 (not res!31178)) b!36588))

(assert (= (and b!36588 (not res!31174)) b!36574))

(assert (= (and b!36574 (not res!31170)) b!36572))

(assert (= (and b!36572 (not res!31177)) b!36582))

(assert (= (and b!36582 (not res!31167)) b!36577))

(assert (= (and b!36577 (not res!31161)) b!36579))

(assert (= (and b!36579 (not res!31173)) b!36576))

(assert (= (and b!36576 (not res!31168)) b!36591))

(assert (= (and b!36591 (not res!31159)) b!36581))

(assert (= (and b!36581 (not res!31162)) b!36586))

(assert (= (and b!36586 (not res!31179)) b!36592))

(assert (= (and b!36592 (not res!31171)) b!36585))

(assert (= (and b!36585 (not res!31163)) b!36584))

(assert (= (and b!36584 (not res!31166)) b!36587))

(assert (= (and b!36587 (not res!31165)) b!36589))

(assert (= (and b!36589 (not res!31175)) b!36590))

(assert (= start!7486 b!36573))

(declare-fun m!55187 () Bool)

(assert (=> b!36589 m!55187))

(declare-fun m!55189 () Bool)

(assert (=> b!36592 m!55189))

(declare-fun m!55191 () Bool)

(assert (=> b!36587 m!55191))

(declare-fun m!55193 () Bool)

(assert (=> b!36587 m!55193))

(declare-fun m!55195 () Bool)

(assert (=> b!36586 m!55195))

(declare-fun m!55197 () Bool)

(assert (=> b!36586 m!55197))

(declare-fun m!55199 () Bool)

(assert (=> b!36591 m!55199))

(declare-fun m!55201 () Bool)

(assert (=> b!36582 m!55201))

(declare-fun m!55203 () Bool)

(assert (=> b!36585 m!55203))

(assert (=> b!36585 m!55203))

(declare-fun m!55205 () Bool)

(assert (=> b!36585 m!55205))

(declare-fun m!55207 () Bool)

(assert (=> b!36585 m!55207))

(declare-fun m!55209 () Bool)

(assert (=> b!36583 m!55209))

(declare-fun m!55211 () Bool)

(assert (=> b!36583 m!55211))

(declare-fun m!55213 () Bool)

(assert (=> b!36583 m!55213))

(declare-fun m!55215 () Bool)

(assert (=> b!36579 m!55215))

(declare-fun m!55217 () Bool)

(assert (=> b!36588 m!55217))

(declare-fun m!55219 () Bool)

(assert (=> b!36575 m!55219))

(declare-fun m!55221 () Bool)

(assert (=> b!36575 m!55221))

(declare-fun m!55223 () Bool)

(assert (=> b!36575 m!55223))

(declare-fun m!55225 () Bool)

(assert (=> b!36575 m!55225))

(declare-fun m!55227 () Bool)

(assert (=> b!36575 m!55227))

(declare-fun m!55229 () Bool)

(assert (=> b!36575 m!55229))

(declare-fun m!55231 () Bool)

(assert (=> b!36575 m!55231))

(declare-fun m!55233 () Bool)

(assert (=> b!36578 m!55233))

(declare-fun m!55235 () Bool)

(assert (=> b!36578 m!55235))

(declare-fun m!55237 () Bool)

(assert (=> b!36578 m!55237))

(assert (=> b!36578 m!55233))

(declare-fun m!55239 () Bool)

(assert (=> b!36578 m!55239))

(declare-fun m!55241 () Bool)

(assert (=> b!36578 m!55241))

(declare-fun m!55243 () Bool)

(assert (=> b!36571 m!55243))

(assert (=> b!36571 m!55243))

(declare-fun m!55245 () Bool)

(assert (=> b!36571 m!55245))

(declare-fun m!55247 () Bool)

(assert (=> b!36571 m!55247))

(assert (=> b!36571 m!55247))

(declare-fun m!55249 () Bool)

(assert (=> b!36571 m!55249))

(declare-fun m!55251 () Bool)

(assert (=> start!7486 m!55251))

(declare-fun m!55253 () Bool)

(assert (=> start!7486 m!55253))

(declare-fun m!55255 () Bool)

(assert (=> b!36584 m!55255))

(declare-fun m!55257 () Bool)

(assert (=> b!36573 m!55257))

(declare-fun m!55259 () Bool)

(assert (=> b!36577 m!55259))

(declare-fun m!55261 () Bool)

(assert (=> b!36580 m!55261))

(declare-fun m!55263 () Bool)

(assert (=> b!36574 m!55263))

(declare-fun m!55265 () Bool)

(assert (=> b!36576 m!55265))

(declare-fun m!55267 () Bool)

(assert (=> b!36576 m!55267))

(declare-fun m!55269 () Bool)

(assert (=> b!36576 m!55269))

(declare-fun m!55271 () Bool)

(assert (=> b!36576 m!55271))

(declare-fun m!55273 () Bool)

(assert (=> b!36576 m!55273))

(declare-fun m!55275 () Bool)

(assert (=> b!36576 m!55275))

(declare-fun m!55277 () Bool)

(assert (=> b!36576 m!55277))

(declare-fun m!55279 () Bool)

(assert (=> b!36576 m!55279))

(declare-fun m!55281 () Bool)

(assert (=> b!36581 m!55281))

(declare-fun m!55283 () Bool)

(assert (=> b!36581 m!55283))

(check-sat (not b!36588) (not b!36592) (not b!36583) (not b!36576) (not b!36575) (not b!36573) (not b!36571) (not b!36581) (not start!7486) (not b!36587) (not b!36585) (not b!36579) (not b!36574) (not b!36578) (not b!36589) (not b!36584) (not b!36577) (not b!36582) (not b!36591) (not b!36580) (not b!36586))
(check-sat)
(get-model)

(declare-fun d!10740 () Bool)

(assert (=> d!10740 (= (head!282 (byteArrayBitContentToList!0 (_2!1890 lt!54886) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!560 (byteArrayBitContentToList!0 (_2!1890 lt!54886) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!36585 d!10740))

(declare-fun d!10742 () Bool)

(declare-fun c!2490 () Bool)

(assert (=> d!10742 (= c!2490 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24193 () List!445)

(assert (=> d!10742 (= (byteArrayBitContentToList!0 (_2!1890 lt!54886) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!24193)))

(declare-fun b!36663 () Bool)

(assert (=> b!36663 (= e!24193 Nil!442)))

(declare-fun b!36664 () Bool)

(assert (=> b!36664 (= e!24193 (Cons!441 (not (= (bvand ((_ sign_extend 24) (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1890 lt!54886) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10742 c!2490) b!36663))

(assert (= (and d!10742 (not c!2490)) b!36664))

(assert (=> b!36664 m!55233))

(declare-fun m!55383 () Bool)

(assert (=> b!36664 m!55383))

(declare-fun m!55385 () Bool)

(assert (=> b!36664 m!55385))

(assert (=> b!36585 d!10742))

(declare-fun d!10744 () Bool)

(assert (=> d!10744 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2888 () Bool)

(assert (= bs!2888 d!10744))

(assert (=> bs!2888 m!55233))

(assert (=> bs!2888 m!55383))

(assert (=> b!36585 d!10744))

(declare-fun d!10746 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10746 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2889 () Bool)

(assert (= bs!2889 d!10746))

(declare-fun m!55387 () Bool)

(assert (=> bs!2889 m!55387))

(assert (=> b!36575 d!10746))

(declare-fun d!10748 () Bool)

(declare-fun res!31251 () Bool)

(declare-fun e!24198 () Bool)

(assert (=> d!10748 (=> (not res!31251) (not e!24198))))

(assert (=> d!10748 (= res!31251 (= (size!860 (buf!1188 thiss!1379)) (size!860 (buf!1188 (_2!1890 lt!54886)))))))

(assert (=> d!10748 (= (isPrefixOf!0 thiss!1379 (_2!1890 lt!54886)) e!24198)))

(declare-fun b!36671 () Bool)

(declare-fun res!31249 () Bool)

(assert (=> b!36671 (=> (not res!31249) (not e!24198))))

(assert (=> b!36671 (= res!31249 (bvsle (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)) (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54886))) (currentByte!2582 (_2!1890 lt!54886)) (currentBit!2577 (_2!1890 lt!54886)))))))

(declare-fun b!36672 () Bool)

(declare-fun e!24199 () Bool)

(assert (=> b!36672 (= e!24198 e!24199)))

(declare-fun res!31250 () Bool)

(assert (=> b!36672 (=> res!31250 e!24199)))

(assert (=> b!36672 (= res!31250 (= (size!860 (buf!1188 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36673 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1924 array!1924 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36673 (= e!24199 (arrayBitRangesEq!0 (buf!1188 thiss!1379) (buf!1188 (_2!1890 lt!54886)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379))))))

(assert (= (and d!10748 res!31251) b!36671))

(assert (= (and b!36671 res!31249) b!36672))

(assert (= (and b!36672 (not res!31250)) b!36673))

(assert (=> b!36671 m!55213))

(assert (=> b!36671 m!55217))

(assert (=> b!36673 m!55213))

(assert (=> b!36673 m!55213))

(declare-fun m!55389 () Bool)

(assert (=> b!36673 m!55389))

(assert (=> b!36575 d!10748))

(declare-fun d!10750 () Bool)

(declare-fun res!31254 () Bool)

(declare-fun e!24200 () Bool)

(assert (=> d!10750 (=> (not res!31254) (not e!24200))))

(assert (=> d!10750 (= res!31254 (= (size!860 (buf!1188 (_2!1890 lt!54893))) (size!860 (buf!1188 (_2!1890 lt!54886)))))))

(assert (=> d!10750 (= (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!54886)) e!24200)))

(declare-fun b!36674 () Bool)

(declare-fun res!31252 () Bool)

(assert (=> b!36674 (=> (not res!31252) (not e!24200))))

(assert (=> b!36674 (= res!31252 (bvsle (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))) (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54886))) (currentByte!2582 (_2!1890 lt!54886)) (currentBit!2577 (_2!1890 lt!54886)))))))

(declare-fun b!36675 () Bool)

(declare-fun e!24201 () Bool)

(assert (=> b!36675 (= e!24200 e!24201)))

(declare-fun res!31253 () Bool)

(assert (=> b!36675 (=> res!31253 e!24201)))

(assert (=> b!36675 (= res!31253 (= (size!860 (buf!1188 (_2!1890 lt!54893))) #b00000000000000000000000000000000))))

(declare-fun b!36676 () Bool)

(assert (=> b!36676 (= e!24201 (arrayBitRangesEq!0 (buf!1188 (_2!1890 lt!54893)) (buf!1188 (_2!1890 lt!54886)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893)))))))

(assert (= (and d!10750 res!31254) b!36674))

(assert (= (and b!36674 res!31252) b!36675))

(assert (= (and b!36675 (not res!31253)) b!36676))

(assert (=> b!36674 m!55201))

(assert (=> b!36674 m!55217))

(assert (=> b!36676 m!55201))

(assert (=> b!36676 m!55201))

(declare-fun m!55391 () Bool)

(assert (=> b!36676 m!55391))

(assert (=> b!36575 d!10750))

(declare-fun b!36687 () Bool)

(declare-fun e!24206 () Unit!2671)

(declare-fun Unit!2675 () Unit!2671)

(assert (=> b!36687 (= e!24206 Unit!2675)))

(declare-fun b!36688 () Bool)

(declare-fun res!31263 () Bool)

(declare-fun e!24207 () Bool)

(assert (=> b!36688 (=> (not res!31263) (not e!24207))))

(declare-fun lt!55027 () tuple2!3604)

(assert (=> b!36688 (= res!31263 (isPrefixOf!0 (_1!1889 lt!55027) thiss!1379))))

(declare-fun d!10752 () Bool)

(assert (=> d!10752 e!24207))

(declare-fun res!31262 () Bool)

(assert (=> d!10752 (=> (not res!31262) (not e!24207))))

(assert (=> d!10752 (= res!31262 (isPrefixOf!0 (_1!1889 lt!55027) (_2!1889 lt!55027)))))

(declare-fun lt!55035 () BitStream!1488)

(assert (=> d!10752 (= lt!55027 (tuple2!3605 lt!55035 (_2!1890 lt!54893)))))

(declare-fun lt!55029 () Unit!2671)

(declare-fun lt!55025 () Unit!2671)

(assert (=> d!10752 (= lt!55029 lt!55025)))

(assert (=> d!10752 (isPrefixOf!0 lt!55035 (_2!1890 lt!54893))))

(assert (=> d!10752 (= lt!55025 (lemmaIsPrefixTransitive!0 lt!55035 (_2!1890 lt!54893) (_2!1890 lt!54893)))))

(declare-fun lt!55019 () Unit!2671)

(declare-fun lt!55033 () Unit!2671)

(assert (=> d!10752 (= lt!55019 lt!55033)))

(assert (=> d!10752 (isPrefixOf!0 lt!55035 (_2!1890 lt!54893))))

(assert (=> d!10752 (= lt!55033 (lemmaIsPrefixTransitive!0 lt!55035 thiss!1379 (_2!1890 lt!54893)))))

(declare-fun lt!55017 () Unit!2671)

(assert (=> d!10752 (= lt!55017 e!24206)))

(declare-fun c!2493 () Bool)

(assert (=> d!10752 (= c!2493 (not (= (size!860 (buf!1188 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!55034 () Unit!2671)

(declare-fun lt!55023 () Unit!2671)

(assert (=> d!10752 (= lt!55034 lt!55023)))

(assert (=> d!10752 (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!54893))))

(assert (=> d!10752 (= lt!55023 (lemmaIsPrefixRefl!0 (_2!1890 lt!54893)))))

(declare-fun lt!55036 () Unit!2671)

(declare-fun lt!55028 () Unit!2671)

(assert (=> d!10752 (= lt!55036 lt!55028)))

(assert (=> d!10752 (= lt!55028 (lemmaIsPrefixRefl!0 (_2!1890 lt!54893)))))

(declare-fun lt!55022 () Unit!2671)

(declare-fun lt!55030 () Unit!2671)

(assert (=> d!10752 (= lt!55022 lt!55030)))

(assert (=> d!10752 (isPrefixOf!0 lt!55035 lt!55035)))

(assert (=> d!10752 (= lt!55030 (lemmaIsPrefixRefl!0 lt!55035))))

(declare-fun lt!55031 () Unit!2671)

(declare-fun lt!55026 () Unit!2671)

(assert (=> d!10752 (= lt!55031 lt!55026)))

(assert (=> d!10752 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10752 (= lt!55026 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10752 (= lt!55035 (BitStream!1489 (buf!1188 (_2!1890 lt!54893)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(assert (=> d!10752 (isPrefixOf!0 thiss!1379 (_2!1890 lt!54893))))

(assert (=> d!10752 (= (reader!0 thiss!1379 (_2!1890 lt!54893)) lt!55027)))

(declare-fun b!36689 () Bool)

(declare-fun res!31261 () Bool)

(assert (=> b!36689 (=> (not res!31261) (not e!24207))))

(assert (=> b!36689 (= res!31261 (isPrefixOf!0 (_2!1889 lt!55027) (_2!1890 lt!54893)))))

(declare-fun b!36690 () Bool)

(declare-fun lt!55021 () (_ BitVec 64))

(declare-fun lt!55018 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1488 (_ BitVec 64)) BitStream!1488)

(assert (=> b!36690 (= e!24207 (= (_1!1889 lt!55027) (withMovedBitIndex!0 (_2!1889 lt!55027) (bvsub lt!55021 lt!55018))))))

(assert (=> b!36690 (or (= (bvand lt!55021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55018 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55021 lt!55018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36690 (= lt!55018 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))))))

(assert (=> b!36690 (= lt!55021 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(declare-fun b!36691 () Bool)

(declare-fun lt!55032 () Unit!2671)

(assert (=> b!36691 (= e!24206 lt!55032)))

(declare-fun lt!55024 () (_ BitVec 64))

(assert (=> b!36691 (= lt!55024 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55020 () (_ BitVec 64))

(assert (=> b!36691 (= lt!55020 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1924 array!1924 (_ BitVec 64) (_ BitVec 64)) Unit!2671)

(assert (=> b!36691 (= lt!55032 (arrayBitRangesEqSymmetric!0 (buf!1188 thiss!1379) (buf!1188 (_2!1890 lt!54893)) lt!55024 lt!55020))))

(assert (=> b!36691 (arrayBitRangesEq!0 (buf!1188 (_2!1890 lt!54893)) (buf!1188 thiss!1379) lt!55024 lt!55020)))

(assert (= (and d!10752 c!2493) b!36691))

(assert (= (and d!10752 (not c!2493)) b!36687))

(assert (= (and d!10752 res!31262) b!36688))

(assert (= (and b!36688 res!31263) b!36689))

(assert (= (and b!36689 res!31261) b!36690))

(declare-fun m!55393 () Bool)

(assert (=> d!10752 m!55393))

(declare-fun m!55395 () Bool)

(assert (=> d!10752 m!55395))

(assert (=> d!10752 m!55209))

(declare-fun m!55397 () Bool)

(assert (=> d!10752 m!55397))

(assert (=> d!10752 m!55211))

(declare-fun m!55399 () Bool)

(assert (=> d!10752 m!55399))

(declare-fun m!55401 () Bool)

(assert (=> d!10752 m!55401))

(declare-fun m!55403 () Bool)

(assert (=> d!10752 m!55403))

(declare-fun m!55405 () Bool)

(assert (=> d!10752 m!55405))

(assert (=> d!10752 m!55237))

(declare-fun m!55407 () Bool)

(assert (=> d!10752 m!55407))

(declare-fun m!55409 () Bool)

(assert (=> b!36690 m!55409))

(assert (=> b!36690 m!55201))

(assert (=> b!36690 m!55213))

(assert (=> b!36691 m!55213))

(declare-fun m!55411 () Bool)

(assert (=> b!36691 m!55411))

(declare-fun m!55413 () Bool)

(assert (=> b!36691 m!55413))

(declare-fun m!55415 () Bool)

(assert (=> b!36689 m!55415))

(declare-fun m!55417 () Bool)

(assert (=> b!36688 m!55417))

(assert (=> b!36575 d!10752))

(declare-fun d!10754 () Bool)

(assert (=> d!10754 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55039 () Unit!2671)

(declare-fun choose!9 (BitStream!1488 array!1924 (_ BitVec 64) BitStream!1488) Unit!2671)

(assert (=> d!10754 (= lt!55039 (choose!9 thiss!1379 (buf!1188 (_2!1890 lt!54893)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1489 (buf!1188 (_2!1890 lt!54893)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379))))))

(assert (=> d!10754 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1188 (_2!1890 lt!54893)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55039)))

(declare-fun bs!2890 () Bool)

(assert (= bs!2890 d!10754))

(assert (=> bs!2890 m!55223))

(declare-fun m!55419 () Bool)

(assert (=> bs!2890 m!55419))

(assert (=> b!36575 d!10754))

(declare-fun b!36873 () Bool)

(declare-fun res!31373 () Bool)

(declare-fun e!24302 () Bool)

(assert (=> b!36873 (=> (not res!31373) (not e!24302))))

(declare-fun lt!55443 () tuple2!3606)

(assert (=> b!36873 (= res!31373 (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!55443)))))

(declare-fun b!36874 () Bool)

(declare-fun res!31374 () Bool)

(assert (=> b!36874 (=> (not res!31374) (not e!24302))))

(assert (=> b!36874 (= res!31374 (= (size!860 (buf!1188 (_2!1890 lt!55443))) (size!860 (buf!1188 (_2!1890 lt!54893)))))))

(declare-fun d!10756 () Bool)

(assert (=> d!10756 e!24302))

(declare-fun res!31371 () Bool)

(assert (=> d!10756 (=> (not res!31371) (not e!24302))))

(declare-fun lt!55459 () (_ BitVec 64))

(assert (=> d!10756 (= res!31371 (= (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55443))) (currentByte!2582 (_2!1890 lt!55443)) (currentBit!2577 (_2!1890 lt!55443))) (bvsub lt!55459 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10756 (or (= (bvand lt!55459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55459 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!55454 () (_ BitVec 64))

(assert (=> d!10756 (= lt!55459 (bvadd lt!55454 to!314))))

(assert (=> d!10756 (or (not (= (bvand lt!55454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!55454 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!55454 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10756 (= lt!55454 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))))))

(declare-fun e!24301 () tuple2!3606)

(assert (=> d!10756 (= lt!55443 e!24301)))

(declare-fun c!2531 () Bool)

(assert (=> d!10756 (= c!2531 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!55456 () Unit!2671)

(declare-fun lt!55442 () Unit!2671)

(assert (=> d!10756 (= lt!55456 lt!55442)))

(assert (=> d!10756 (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!54893))))

(assert (=> d!10756 (= lt!55442 (lemmaIsPrefixRefl!0 (_2!1890 lt!54893)))))

(declare-fun lt!55446 () (_ BitVec 64))

(assert (=> d!10756 (= lt!55446 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))))))

(assert (=> d!10756 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10756 (= (appendBitsMSBFirstLoop!0 (_2!1890 lt!54893) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!55443)))

(declare-fun b!36875 () Bool)

(declare-fun e!24300 () Bool)

(declare-fun lt!55441 () (_ BitVec 64))

(assert (=> b!36875 (= e!24300 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!55441))))

(declare-fun b!36876 () Bool)

(declare-fun res!31370 () Bool)

(assert (=> b!36876 (=> (not res!31370) (not e!24302))))

(assert (=> b!36876 (= res!31370 (invariant!0 (currentBit!2577 (_2!1890 lt!55443)) (currentByte!2582 (_2!1890 lt!55443)) (size!860 (buf!1188 (_2!1890 lt!55443)))))))

(declare-fun lt!55476 () tuple2!3606)

(declare-fun call!457 () tuple2!3604)

(declare-fun bm!454 () Bool)

(assert (=> bm!454 (= call!457 (reader!0 (_2!1890 lt!54893) (ite c!2531 (_2!1890 lt!55476) (_2!1890 lt!54893))))))

(declare-fun b!36877 () Bool)

(declare-fun res!31372 () Bool)

(assert (=> b!36877 (=> (not res!31372) (not e!24302))))

(assert (=> b!36877 (= res!31372 (= (size!860 (buf!1188 (_2!1890 lt!54893))) (size!860 (buf!1188 (_2!1890 lt!55443)))))))

(declare-fun b!36878 () Bool)

(declare-fun Unit!2676 () Unit!2671)

(assert (=> b!36878 (= e!24301 (tuple2!3607 Unit!2676 (_2!1890 lt!54893)))))

(assert (=> b!36878 (= (size!860 (buf!1188 (_2!1890 lt!54893))) (size!860 (buf!1188 (_2!1890 lt!54893))))))

(declare-fun lt!55478 () Unit!2671)

(declare-fun Unit!2677 () Unit!2671)

(assert (=> b!36878 (= lt!55478 Unit!2677)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1488 array!1924 array!1924 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3616 0))(
  ( (tuple2!3617 (_1!1895 array!1924) (_2!1895 BitStream!1488)) )
))
(declare-fun readBits!0 (BitStream!1488 (_ BitVec 64)) tuple2!3616)

(assert (=> b!36878 (checkByteArrayBitContent!0 (_2!1890 lt!54893) srcBuffer!2 (_1!1895 (readBits!0 (_1!1889 call!457) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!36879 () Bool)

(declare-fun lt!55480 () tuple2!3604)

(assert (=> b!36879 (= e!24302 (= (bitStreamReadBitsIntoList!0 (_2!1890 lt!55443) (_1!1889 lt!55480) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1890 lt!55443) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!36879 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36879 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!55467 () Unit!2671)

(declare-fun lt!55453 () Unit!2671)

(assert (=> b!36879 (= lt!55467 lt!55453)))

(assert (=> b!36879 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!55443)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!55441)))

(assert (=> b!36879 (= lt!55453 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1890 lt!54893) (buf!1188 (_2!1890 lt!55443)) lt!55441))))

(assert (=> b!36879 e!24300))

(declare-fun res!31375 () Bool)

(assert (=> b!36879 (=> (not res!31375) (not e!24300))))

(assert (=> b!36879 (= res!31375 (and (= (size!860 (buf!1188 (_2!1890 lt!54893))) (size!860 (buf!1188 (_2!1890 lt!55443)))) (bvsge lt!55441 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36879 (= lt!55441 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!36879 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36879 (= lt!55480 (reader!0 (_2!1890 lt!54893) (_2!1890 lt!55443)))))

(declare-fun b!36880 () Bool)

(declare-fun Unit!2678 () Unit!2671)

(assert (=> b!36880 (= e!24301 (tuple2!3607 Unit!2678 (_2!1890 lt!55476)))))

(declare-fun lt!55445 () tuple2!3606)

(assert (=> b!36880 (= lt!55445 (appendBitFromByte!0 (_2!1890 lt!54893) (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!55479 () (_ BitVec 64))

(assert (=> b!36880 (= lt!55479 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55466 () (_ BitVec 64))

(assert (=> b!36880 (= lt!55466 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55455 () Unit!2671)

(assert (=> b!36880 (= lt!55455 (validateOffsetBitsIneqLemma!0 (_2!1890 lt!54893) (_2!1890 lt!55445) lt!55479 lt!55466))))

(assert (=> b!36880 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!55445)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!55445))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!55445))) (bvsub lt!55479 lt!55466))))

(declare-fun lt!55450 () Unit!2671)

(assert (=> b!36880 (= lt!55450 lt!55455)))

(declare-fun lt!55452 () tuple2!3604)

(assert (=> b!36880 (= lt!55452 (reader!0 (_2!1890 lt!54893) (_2!1890 lt!55445)))))

(declare-fun lt!55470 () (_ BitVec 64))

(assert (=> b!36880 (= lt!55470 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55465 () Unit!2671)

(assert (=> b!36880 (= lt!55465 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1890 lt!54893) (buf!1188 (_2!1890 lt!55445)) lt!55470))))

(assert (=> b!36880 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!55445)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!55470)))

(declare-fun lt!55475 () Unit!2671)

(assert (=> b!36880 (= lt!55475 lt!55465)))

(assert (=> b!36880 (= (head!282 (byteArrayBitContentToList!0 (_2!1890 lt!55445) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!282 (bitStreamReadBitsIntoList!0 (_2!1890 lt!55445) (_1!1889 lt!55452) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55439 () Unit!2671)

(declare-fun Unit!2679 () Unit!2671)

(assert (=> b!36880 (= lt!55439 Unit!2679)))

(assert (=> b!36880 (= lt!55476 (appendBitsMSBFirstLoop!0 (_2!1890 lt!55445) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!55447 () Unit!2671)

(assert (=> b!36880 (= lt!55447 (lemmaIsPrefixTransitive!0 (_2!1890 lt!54893) (_2!1890 lt!55445) (_2!1890 lt!55476)))))

(assert (=> b!36880 (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!55476))))

(declare-fun lt!55472 () Unit!2671)

(assert (=> b!36880 (= lt!55472 lt!55447)))

(assert (=> b!36880 (= (size!860 (buf!1188 (_2!1890 lt!55476))) (size!860 (buf!1188 (_2!1890 lt!54893))))))

(declare-fun lt!55448 () Unit!2671)

(declare-fun Unit!2680 () Unit!2671)

(assert (=> b!36880 (= lt!55448 Unit!2680)))

(assert (=> b!36880 (= (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55476))) (currentByte!2582 (_2!1890 lt!55476)) (currentBit!2577 (_2!1890 lt!55476))) (bvsub (bvadd (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55477 () Unit!2671)

(declare-fun Unit!2681 () Unit!2671)

(assert (=> b!36880 (= lt!55477 Unit!2681)))

(assert (=> b!36880 (= (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55476))) (currentByte!2582 (_2!1890 lt!55476)) (currentBit!2577 (_2!1890 lt!55476))) (bvsub (bvsub (bvadd (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55445))) (currentByte!2582 (_2!1890 lt!55445)) (currentBit!2577 (_2!1890 lt!55445))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!55468 () Unit!2671)

(declare-fun Unit!2682 () Unit!2671)

(assert (=> b!36880 (= lt!55468 Unit!2682)))

(declare-fun lt!55449 () tuple2!3604)

(assert (=> b!36880 (= lt!55449 call!457)))

(declare-fun lt!55474 () (_ BitVec 64))

(assert (=> b!36880 (= lt!55474 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55473 () Unit!2671)

(assert (=> b!36880 (= lt!55473 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1890 lt!54893) (buf!1188 (_2!1890 lt!55476)) lt!55474))))

(assert (=> b!36880 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!55476)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!55474)))

(declare-fun lt!55458 () Unit!2671)

(assert (=> b!36880 (= lt!55458 lt!55473)))

(declare-fun lt!55460 () tuple2!3604)

(assert (=> b!36880 (= lt!55460 (reader!0 (_2!1890 lt!55445) (_2!1890 lt!55476)))))

(declare-fun lt!55440 () (_ BitVec 64))

(assert (=> b!36880 (= lt!55440 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!55461 () Unit!2671)

(assert (=> b!36880 (= lt!55461 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1890 lt!55445) (buf!1188 (_2!1890 lt!55476)) lt!55440))))

(assert (=> b!36880 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!55476)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!55445))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!55445))) lt!55440)))

(declare-fun lt!55444 () Unit!2671)

(assert (=> b!36880 (= lt!55444 lt!55461)))

(declare-fun lt!55464 () List!445)

(assert (=> b!36880 (= lt!55464 (byteArrayBitContentToList!0 (_2!1890 lt!55476) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!55451 () List!445)

(assert (=> b!36880 (= lt!55451 (byteArrayBitContentToList!0 (_2!1890 lt!55476) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55438 () List!445)

(assert (=> b!36880 (= lt!55438 (bitStreamReadBitsIntoList!0 (_2!1890 lt!55476) (_1!1889 lt!55449) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!55463 () List!445)

(assert (=> b!36880 (= lt!55463 (bitStreamReadBitsIntoList!0 (_2!1890 lt!55476) (_1!1889 lt!55460) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!55471 () (_ BitVec 64))

(assert (=> b!36880 (= lt!55471 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!55462 () Unit!2671)

(assert (=> b!36880 (= lt!55462 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1890 lt!55476) (_2!1890 lt!55476) (_1!1889 lt!55449) (_1!1889 lt!55460) lt!55471 lt!55438))))

(assert (=> b!36880 (= (bitStreamReadBitsIntoList!0 (_2!1890 lt!55476) (_1!1889 lt!55460) (bvsub lt!55471 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!162 lt!55438))))

(declare-fun lt!55469 () Unit!2671)

(assert (=> b!36880 (= lt!55469 lt!55462)))

(declare-fun lt!55437 () Unit!2671)

(assert (=> b!36880 (= lt!55437 (arrayBitRangesEqImpliesEq!0 (buf!1188 (_2!1890 lt!55445)) (buf!1188 (_2!1890 lt!55476)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!55446 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55445))) (currentByte!2582 (_2!1890 lt!55445)) (currentBit!2577 (_2!1890 lt!55445)))))))

(assert (=> b!36880 (= (bitAt!0 (buf!1188 (_2!1890 lt!55445)) lt!55446) (bitAt!0 (buf!1188 (_2!1890 lt!55476)) lt!55446))))

(declare-fun lt!55457 () Unit!2671)

(assert (=> b!36880 (= lt!55457 lt!55437)))

(assert (= (and d!10756 c!2531) b!36880))

(assert (= (and d!10756 (not c!2531)) b!36878))

(assert (= (or b!36880 b!36878) bm!454))

(assert (= (and d!10756 res!31371) b!36876))

(assert (= (and b!36876 res!31370) b!36877))

(assert (= (and b!36877 res!31372) b!36873))

(assert (= (and b!36873 res!31373) b!36874))

(assert (= (and b!36874 res!31374) b!36879))

(assert (= (and b!36879 res!31375) b!36875))

(declare-fun m!55673 () Bool)

(assert (=> b!36880 m!55673))

(declare-fun m!55675 () Bool)

(assert (=> b!36880 m!55675))

(declare-fun m!55677 () Bool)

(assert (=> b!36880 m!55677))

(declare-fun m!55679 () Bool)

(assert (=> b!36880 m!55679))

(declare-fun m!55681 () Bool)

(assert (=> b!36880 m!55681))

(declare-fun m!55683 () Bool)

(assert (=> b!36880 m!55683))

(declare-fun m!55685 () Bool)

(assert (=> b!36880 m!55685))

(declare-fun m!55687 () Bool)

(assert (=> b!36880 m!55687))

(assert (=> b!36880 m!55201))

(declare-fun m!55689 () Bool)

(assert (=> b!36880 m!55689))

(declare-fun m!55691 () Bool)

(assert (=> b!36880 m!55691))

(declare-fun m!55693 () Bool)

(assert (=> b!36880 m!55693))

(declare-fun m!55695 () Bool)

(assert (=> b!36880 m!55695))

(declare-fun m!55697 () Bool)

(assert (=> b!36880 m!55697))

(declare-fun m!55699 () Bool)

(assert (=> b!36880 m!55699))

(declare-fun m!55701 () Bool)

(assert (=> b!36880 m!55701))

(declare-fun m!55703 () Bool)

(assert (=> b!36880 m!55703))

(declare-fun m!55705 () Bool)

(assert (=> b!36880 m!55705))

(declare-fun m!55707 () Bool)

(assert (=> b!36880 m!55707))

(declare-fun m!55709 () Bool)

(assert (=> b!36880 m!55709))

(declare-fun m!55711 () Bool)

(assert (=> b!36880 m!55711))

(assert (=> b!36880 m!55707))

(declare-fun m!55713 () Bool)

(assert (=> b!36880 m!55713))

(declare-fun m!55715 () Bool)

(assert (=> b!36880 m!55715))

(assert (=> b!36880 m!55701))

(declare-fun m!55717 () Bool)

(assert (=> b!36880 m!55717))

(declare-fun m!55719 () Bool)

(assert (=> b!36880 m!55719))

(declare-fun m!55721 () Bool)

(assert (=> b!36880 m!55721))

(assert (=> b!36880 m!55683))

(declare-fun m!55723 () Bool)

(assert (=> b!36880 m!55723))

(declare-fun m!55725 () Bool)

(assert (=> b!36880 m!55725))

(declare-fun m!55727 () Bool)

(assert (=> b!36880 m!55727))

(declare-fun m!55729 () Bool)

(assert (=> b!36880 m!55729))

(assert (=> b!36880 m!55673))

(declare-fun m!55731 () Bool)

(assert (=> b!36880 m!55731))

(declare-fun m!55733 () Bool)

(assert (=> b!36880 m!55733))

(declare-fun m!55735 () Bool)

(assert (=> b!36875 m!55735))

(declare-fun m!55737 () Bool)

(assert (=> b!36873 m!55737))

(declare-fun m!55739 () Bool)

(assert (=> b!36878 m!55739))

(declare-fun m!55741 () Bool)

(assert (=> b!36878 m!55741))

(declare-fun m!55743 () Bool)

(assert (=> b!36879 m!55743))

(declare-fun m!55745 () Bool)

(assert (=> b!36879 m!55745))

(declare-fun m!55747 () Bool)

(assert (=> b!36879 m!55747))

(declare-fun m!55749 () Bool)

(assert (=> b!36879 m!55749))

(declare-fun m!55751 () Bool)

(assert (=> b!36879 m!55751))

(declare-fun m!55753 () Bool)

(assert (=> b!36876 m!55753))

(declare-fun m!55755 () Bool)

(assert (=> d!10756 m!55755))

(assert (=> d!10756 m!55201))

(assert (=> d!10756 m!55393))

(assert (=> d!10756 m!55407))

(declare-fun m!55757 () Bool)

(assert (=> bm!454 m!55757))

(assert (=> b!36575 d!10756))

(declare-fun d!10886 () Bool)

(assert (=> d!10886 (isPrefixOf!0 thiss!1379 (_2!1890 lt!54886))))

(declare-fun lt!55483 () Unit!2671)

(declare-fun choose!30 (BitStream!1488 BitStream!1488 BitStream!1488) Unit!2671)

(assert (=> d!10886 (= lt!55483 (choose!30 thiss!1379 (_2!1890 lt!54893) (_2!1890 lt!54886)))))

(assert (=> d!10886 (isPrefixOf!0 thiss!1379 (_2!1890 lt!54893))))

(assert (=> d!10886 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1890 lt!54893) (_2!1890 lt!54886)) lt!55483)))

(declare-fun bs!2915 () Bool)

(assert (= bs!2915 d!10886))

(assert (=> bs!2915 m!55231))

(declare-fun m!55759 () Bool)

(assert (=> bs!2915 m!55759))

(assert (=> bs!2915 m!55237))

(assert (=> b!36575 d!10886))

(declare-fun d!10888 () Bool)

(assert (=> d!10888 (= (bitAt!0 (buf!1188 (_1!1889 lt!54894)) lt!54900) (not (= (bvand ((_ sign_extend 24) (select (arr!1347 (buf!1188 (_1!1889 lt!54894))) ((_ extract 31 0) (bvsdiv lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2916 () Bool)

(assert (= bs!2916 d!10888))

(declare-fun m!55761 () Bool)

(assert (=> bs!2916 m!55761))

(declare-fun m!55763 () Bool)

(assert (=> bs!2916 m!55763))

(assert (=> b!36586 d!10888))

(declare-fun d!10890 () Bool)

(assert (=> d!10890 (= (bitAt!0 (buf!1188 (_1!1889 lt!54884)) lt!54900) (not (= (bvand ((_ sign_extend 24) (select (arr!1347 (buf!1188 (_1!1889 lt!54884))) ((_ extract 31 0) (bvsdiv lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2917 () Bool)

(assert (= bs!2917 d!10890))

(declare-fun m!55765 () Bool)

(assert (=> bs!2917 m!55765))

(assert (=> bs!2917 m!55763))

(assert (=> b!36586 d!10890))

(declare-fun d!10892 () Bool)

(declare-fun e!24308 () Bool)

(assert (=> d!10892 e!24308))

(declare-fun c!2537 () Bool)

(assert (=> d!10892 (= c!2537 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!55492 () List!445)

(declare-datatypes ((tuple2!3618 0))(
  ( (tuple2!3619 (_1!1896 List!445) (_2!1896 BitStream!1488)) )
))
(declare-fun e!24307 () tuple2!3618)

(assert (=> d!10892 (= lt!55492 (_1!1896 e!24307))))

(declare-fun c!2536 () Bool)

(assert (=> d!10892 (= c!2536 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10892 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10892 (= (bitStreamReadBitsIntoList!0 (_2!1890 lt!54886) (_1!1889 lt!54884) (bvsub to!314 i!635)) lt!55492)))

(declare-fun b!36892 () Bool)

(assert (=> b!36892 (= e!24308 (> (length!171 lt!55492) 0))))

(declare-fun b!36889 () Bool)

(assert (=> b!36889 (= e!24307 (tuple2!3619 Nil!442 (_1!1889 lt!54884)))))

(declare-fun b!36891 () Bool)

(declare-fun isEmpty!102 (List!445) Bool)

(assert (=> b!36891 (= e!24308 (isEmpty!102 lt!55492))))

(declare-fun lt!55490 () (_ BitVec 64))

(declare-fun b!36890 () Bool)

(declare-datatypes ((tuple2!3620 0))(
  ( (tuple2!3621 (_1!1897 Bool) (_2!1897 BitStream!1488)) )
))
(declare-fun lt!55491 () tuple2!3620)

(assert (=> b!36890 (= e!24307 (tuple2!3619 (Cons!441 (_1!1897 lt!55491) (bitStreamReadBitsIntoList!0 (_2!1890 lt!54886) (_2!1897 lt!55491) (bvsub (bvsub to!314 i!635) lt!55490))) (_2!1897 lt!55491)))))

(declare-fun readBit!0 (BitStream!1488) tuple2!3620)

(assert (=> b!36890 (= lt!55491 (readBit!0 (_1!1889 lt!54884)))))

(assert (=> b!36890 (= lt!55490 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!10892 c!2536) b!36889))

(assert (= (and d!10892 (not c!2536)) b!36890))

(assert (= (and d!10892 c!2537) b!36891))

(assert (= (and d!10892 (not c!2537)) b!36892))

(declare-fun m!55767 () Bool)

(assert (=> b!36892 m!55767))

(declare-fun m!55769 () Bool)

(assert (=> b!36891 m!55769))

(declare-fun m!55771 () Bool)

(assert (=> b!36890 m!55771))

(declare-fun m!55773 () Bool)

(assert (=> b!36890 m!55773))

(assert (=> b!36576 d!10892))

(declare-fun d!10894 () Bool)

(assert (=> d!10894 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!55493 () Unit!2671)

(assert (=> d!10894 (= lt!55493 (choose!9 thiss!1379 (buf!1188 (_2!1890 lt!54886)) (bvsub to!314 i!635) (BitStream!1489 (buf!1188 (_2!1890 lt!54886)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379))))))

(assert (=> d!10894 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1188 (_2!1890 lt!54886)) (bvsub to!314 i!635)) lt!55493)))

(declare-fun bs!2918 () Bool)

(assert (= bs!2918 d!10894))

(assert (=> bs!2918 m!55265))

(declare-fun m!55775 () Bool)

(assert (=> bs!2918 m!55775))

(assert (=> b!36576 d!10894))

(declare-fun b!36893 () Bool)

(declare-fun e!24309 () Unit!2671)

(declare-fun Unit!2683 () Unit!2671)

(assert (=> b!36893 (= e!24309 Unit!2683)))

(declare-fun b!36894 () Bool)

(declare-fun res!31378 () Bool)

(declare-fun e!24310 () Bool)

(assert (=> b!36894 (=> (not res!31378) (not e!24310))))

(declare-fun lt!55504 () tuple2!3604)

(assert (=> b!36894 (= res!31378 (isPrefixOf!0 (_1!1889 lt!55504) thiss!1379))))

(declare-fun d!10896 () Bool)

(assert (=> d!10896 e!24310))

(declare-fun res!31377 () Bool)

(assert (=> d!10896 (=> (not res!31377) (not e!24310))))

(assert (=> d!10896 (= res!31377 (isPrefixOf!0 (_1!1889 lt!55504) (_2!1889 lt!55504)))))

(declare-fun lt!55512 () BitStream!1488)

(assert (=> d!10896 (= lt!55504 (tuple2!3605 lt!55512 (_2!1890 lt!54886)))))

(declare-fun lt!55506 () Unit!2671)

(declare-fun lt!55502 () Unit!2671)

(assert (=> d!10896 (= lt!55506 lt!55502)))

(assert (=> d!10896 (isPrefixOf!0 lt!55512 (_2!1890 lt!54886))))

(assert (=> d!10896 (= lt!55502 (lemmaIsPrefixTransitive!0 lt!55512 (_2!1890 lt!54886) (_2!1890 lt!54886)))))

(declare-fun lt!55496 () Unit!2671)

(declare-fun lt!55510 () Unit!2671)

(assert (=> d!10896 (= lt!55496 lt!55510)))

(assert (=> d!10896 (isPrefixOf!0 lt!55512 (_2!1890 lt!54886))))

(assert (=> d!10896 (= lt!55510 (lemmaIsPrefixTransitive!0 lt!55512 thiss!1379 (_2!1890 lt!54886)))))

(declare-fun lt!55494 () Unit!2671)

(assert (=> d!10896 (= lt!55494 e!24309)))

(declare-fun c!2538 () Bool)

(assert (=> d!10896 (= c!2538 (not (= (size!860 (buf!1188 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!55511 () Unit!2671)

(declare-fun lt!55500 () Unit!2671)

(assert (=> d!10896 (= lt!55511 lt!55500)))

(assert (=> d!10896 (isPrefixOf!0 (_2!1890 lt!54886) (_2!1890 lt!54886))))

(assert (=> d!10896 (= lt!55500 (lemmaIsPrefixRefl!0 (_2!1890 lt!54886)))))

(declare-fun lt!55513 () Unit!2671)

(declare-fun lt!55505 () Unit!2671)

(assert (=> d!10896 (= lt!55513 lt!55505)))

(assert (=> d!10896 (= lt!55505 (lemmaIsPrefixRefl!0 (_2!1890 lt!54886)))))

(declare-fun lt!55499 () Unit!2671)

(declare-fun lt!55507 () Unit!2671)

(assert (=> d!10896 (= lt!55499 lt!55507)))

(assert (=> d!10896 (isPrefixOf!0 lt!55512 lt!55512)))

(assert (=> d!10896 (= lt!55507 (lemmaIsPrefixRefl!0 lt!55512))))

(declare-fun lt!55508 () Unit!2671)

(declare-fun lt!55503 () Unit!2671)

(assert (=> d!10896 (= lt!55508 lt!55503)))

(assert (=> d!10896 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10896 (= lt!55503 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10896 (= lt!55512 (BitStream!1489 (buf!1188 (_2!1890 lt!54886)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(assert (=> d!10896 (isPrefixOf!0 thiss!1379 (_2!1890 lt!54886))))

(assert (=> d!10896 (= (reader!0 thiss!1379 (_2!1890 lt!54886)) lt!55504)))

(declare-fun b!36895 () Bool)

(declare-fun res!31376 () Bool)

(assert (=> b!36895 (=> (not res!31376) (not e!24310))))

(assert (=> b!36895 (= res!31376 (isPrefixOf!0 (_2!1889 lt!55504) (_2!1890 lt!54886)))))

(declare-fun lt!55495 () (_ BitVec 64))

(declare-fun b!36896 () Bool)

(declare-fun lt!55498 () (_ BitVec 64))

(assert (=> b!36896 (= e!24310 (= (_1!1889 lt!55504) (withMovedBitIndex!0 (_2!1889 lt!55504) (bvsub lt!55498 lt!55495))))))

(assert (=> b!36896 (or (= (bvand lt!55498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55498 lt!55495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36896 (= lt!55495 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54886))) (currentByte!2582 (_2!1890 lt!54886)) (currentBit!2577 (_2!1890 lt!54886))))))

(assert (=> b!36896 (= lt!55498 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(declare-fun b!36897 () Bool)

(declare-fun lt!55509 () Unit!2671)

(assert (=> b!36897 (= e!24309 lt!55509)))

(declare-fun lt!55501 () (_ BitVec 64))

(assert (=> b!36897 (= lt!55501 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55497 () (_ BitVec 64))

(assert (=> b!36897 (= lt!55497 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(assert (=> b!36897 (= lt!55509 (arrayBitRangesEqSymmetric!0 (buf!1188 thiss!1379) (buf!1188 (_2!1890 lt!54886)) lt!55501 lt!55497))))

(assert (=> b!36897 (arrayBitRangesEq!0 (buf!1188 (_2!1890 lt!54886)) (buf!1188 thiss!1379) lt!55501 lt!55497)))

(assert (= (and d!10896 c!2538) b!36897))

(assert (= (and d!10896 (not c!2538)) b!36893))

(assert (= (and d!10896 res!31377) b!36894))

(assert (= (and b!36894 res!31378) b!36895))

(assert (= (and b!36895 res!31376) b!36896))

(declare-fun m!55777 () Bool)

(assert (=> d!10896 m!55777))

(declare-fun m!55779 () Bool)

(assert (=> d!10896 m!55779))

(assert (=> d!10896 m!55209))

(declare-fun m!55781 () Bool)

(assert (=> d!10896 m!55781))

(assert (=> d!10896 m!55211))

(declare-fun m!55783 () Bool)

(assert (=> d!10896 m!55783))

(declare-fun m!55785 () Bool)

(assert (=> d!10896 m!55785))

(declare-fun m!55787 () Bool)

(assert (=> d!10896 m!55787))

(declare-fun m!55789 () Bool)

(assert (=> d!10896 m!55789))

(assert (=> d!10896 m!55231))

(declare-fun m!55791 () Bool)

(assert (=> d!10896 m!55791))

(declare-fun m!55793 () Bool)

(assert (=> b!36896 m!55793))

(assert (=> b!36896 m!55217))

(assert (=> b!36896 m!55213))

(assert (=> b!36897 m!55213))

(declare-fun m!55795 () Bool)

(assert (=> b!36897 m!55795))

(declare-fun m!55797 () Bool)

(assert (=> b!36897 m!55797))

(declare-fun m!55799 () Bool)

(assert (=> b!36895 m!55799))

(declare-fun m!55801 () Bool)

(assert (=> b!36894 m!55801))

(assert (=> b!36576 d!10896))

(declare-fun b!36898 () Bool)

(declare-fun e!24311 () Unit!2671)

(declare-fun Unit!2684 () Unit!2671)

(assert (=> b!36898 (= e!24311 Unit!2684)))

(declare-fun b!36899 () Bool)

(declare-fun res!31381 () Bool)

(declare-fun e!24312 () Bool)

(assert (=> b!36899 (=> (not res!31381) (not e!24312))))

(declare-fun lt!55524 () tuple2!3604)

(assert (=> b!36899 (= res!31381 (isPrefixOf!0 (_1!1889 lt!55524) (_2!1890 lt!54893)))))

(declare-fun d!10898 () Bool)

(assert (=> d!10898 e!24312))

(declare-fun res!31380 () Bool)

(assert (=> d!10898 (=> (not res!31380) (not e!24312))))

(assert (=> d!10898 (= res!31380 (isPrefixOf!0 (_1!1889 lt!55524) (_2!1889 lt!55524)))))

(declare-fun lt!55532 () BitStream!1488)

(assert (=> d!10898 (= lt!55524 (tuple2!3605 lt!55532 (_2!1890 lt!54886)))))

(declare-fun lt!55526 () Unit!2671)

(declare-fun lt!55522 () Unit!2671)

(assert (=> d!10898 (= lt!55526 lt!55522)))

(assert (=> d!10898 (isPrefixOf!0 lt!55532 (_2!1890 lt!54886))))

(assert (=> d!10898 (= lt!55522 (lemmaIsPrefixTransitive!0 lt!55532 (_2!1890 lt!54886) (_2!1890 lt!54886)))))

(declare-fun lt!55516 () Unit!2671)

(declare-fun lt!55530 () Unit!2671)

(assert (=> d!10898 (= lt!55516 lt!55530)))

(assert (=> d!10898 (isPrefixOf!0 lt!55532 (_2!1890 lt!54886))))

(assert (=> d!10898 (= lt!55530 (lemmaIsPrefixTransitive!0 lt!55532 (_2!1890 lt!54893) (_2!1890 lt!54886)))))

(declare-fun lt!55514 () Unit!2671)

(assert (=> d!10898 (= lt!55514 e!24311)))

(declare-fun c!2539 () Bool)

(assert (=> d!10898 (= c!2539 (not (= (size!860 (buf!1188 (_2!1890 lt!54893))) #b00000000000000000000000000000000)))))

(declare-fun lt!55531 () Unit!2671)

(declare-fun lt!55520 () Unit!2671)

(assert (=> d!10898 (= lt!55531 lt!55520)))

(assert (=> d!10898 (isPrefixOf!0 (_2!1890 lt!54886) (_2!1890 lt!54886))))

(assert (=> d!10898 (= lt!55520 (lemmaIsPrefixRefl!0 (_2!1890 lt!54886)))))

(declare-fun lt!55533 () Unit!2671)

(declare-fun lt!55525 () Unit!2671)

(assert (=> d!10898 (= lt!55533 lt!55525)))

(assert (=> d!10898 (= lt!55525 (lemmaIsPrefixRefl!0 (_2!1890 lt!54886)))))

(declare-fun lt!55519 () Unit!2671)

(declare-fun lt!55527 () Unit!2671)

(assert (=> d!10898 (= lt!55519 lt!55527)))

(assert (=> d!10898 (isPrefixOf!0 lt!55532 lt!55532)))

(assert (=> d!10898 (= lt!55527 (lemmaIsPrefixRefl!0 lt!55532))))

(declare-fun lt!55528 () Unit!2671)

(declare-fun lt!55523 () Unit!2671)

(assert (=> d!10898 (= lt!55528 lt!55523)))

(assert (=> d!10898 (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!54893))))

(assert (=> d!10898 (= lt!55523 (lemmaIsPrefixRefl!0 (_2!1890 lt!54893)))))

(assert (=> d!10898 (= lt!55532 (BitStream!1489 (buf!1188 (_2!1890 lt!54886)) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))))))

(assert (=> d!10898 (isPrefixOf!0 (_2!1890 lt!54893) (_2!1890 lt!54886))))

(assert (=> d!10898 (= (reader!0 (_2!1890 lt!54893) (_2!1890 lt!54886)) lt!55524)))

(declare-fun b!36900 () Bool)

(declare-fun res!31379 () Bool)

(assert (=> b!36900 (=> (not res!31379) (not e!24312))))

(assert (=> b!36900 (= res!31379 (isPrefixOf!0 (_2!1889 lt!55524) (_2!1890 lt!54886)))))

(declare-fun lt!55518 () (_ BitVec 64))

(declare-fun lt!55515 () (_ BitVec 64))

(declare-fun b!36901 () Bool)

(assert (=> b!36901 (= e!24312 (= (_1!1889 lt!55524) (withMovedBitIndex!0 (_2!1889 lt!55524) (bvsub lt!55518 lt!55515))))))

(assert (=> b!36901 (or (= (bvand lt!55518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55518 lt!55515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36901 (= lt!55515 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54886))) (currentByte!2582 (_2!1890 lt!54886)) (currentBit!2577 (_2!1890 lt!54886))))))

(assert (=> b!36901 (= lt!55518 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))))))

(declare-fun b!36902 () Bool)

(declare-fun lt!55529 () Unit!2671)

(assert (=> b!36902 (= e!24311 lt!55529)))

(declare-fun lt!55521 () (_ BitVec 64))

(assert (=> b!36902 (= lt!55521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!55517 () (_ BitVec 64))

(assert (=> b!36902 (= lt!55517 (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))))))

(assert (=> b!36902 (= lt!55529 (arrayBitRangesEqSymmetric!0 (buf!1188 (_2!1890 lt!54893)) (buf!1188 (_2!1890 lt!54886)) lt!55521 lt!55517))))

(assert (=> b!36902 (arrayBitRangesEq!0 (buf!1188 (_2!1890 lt!54886)) (buf!1188 (_2!1890 lt!54893)) lt!55521 lt!55517)))

(assert (= (and d!10898 c!2539) b!36902))

(assert (= (and d!10898 (not c!2539)) b!36898))

(assert (= (and d!10898 res!31380) b!36899))

(assert (= (and b!36899 res!31381) b!36900))

(assert (= (and b!36900 res!31379) b!36901))

(assert (=> d!10898 m!55777))

(declare-fun m!55803 () Bool)

(assert (=> d!10898 m!55803))

(assert (=> d!10898 m!55393))

(declare-fun m!55805 () Bool)

(assert (=> d!10898 m!55805))

(assert (=> d!10898 m!55407))

(declare-fun m!55807 () Bool)

(assert (=> d!10898 m!55807))

(declare-fun m!55809 () Bool)

(assert (=> d!10898 m!55809))

(declare-fun m!55811 () Bool)

(assert (=> d!10898 m!55811))

(declare-fun m!55813 () Bool)

(assert (=> d!10898 m!55813))

(assert (=> d!10898 m!55227))

(assert (=> d!10898 m!55791))

(declare-fun m!55815 () Bool)

(assert (=> b!36901 m!55815))

(assert (=> b!36901 m!55217))

(assert (=> b!36901 m!55201))

(assert (=> b!36902 m!55201))

(declare-fun m!55817 () Bool)

(assert (=> b!36902 m!55817))

(declare-fun m!55819 () Bool)

(assert (=> b!36902 m!55819))

(declare-fun m!55821 () Bool)

(assert (=> b!36900 m!55821))

(declare-fun m!55823 () Bool)

(assert (=> b!36899 m!55823))

(assert (=> b!36576 d!10898))

(declare-fun d!10900 () Bool)

(assert (=> d!10900 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!54896)))

(declare-fun lt!55534 () Unit!2671)

(assert (=> d!10900 (= lt!55534 (choose!9 (_2!1890 lt!54893) (buf!1188 (_2!1890 lt!54886)) lt!54896 (BitStream!1489 (buf!1188 (_2!1890 lt!54886)) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893)))))))

(assert (=> d!10900 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1890 lt!54893) (buf!1188 (_2!1890 lt!54886)) lt!54896) lt!55534)))

(declare-fun bs!2919 () Bool)

(assert (= bs!2919 d!10900))

(assert (=> bs!2919 m!55277))

(declare-fun m!55825 () Bool)

(assert (=> bs!2919 m!55825))

(assert (=> b!36576 d!10900))

(declare-fun d!10902 () Bool)

(assert (=> d!10902 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2920 () Bool)

(assert (= bs!2920 d!10902))

(declare-fun m!55827 () Bool)

(assert (=> bs!2920 m!55827))

(assert (=> b!36576 d!10902))

(declare-fun d!10904 () Bool)

(assert (=> d!10904 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!54896) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893)))) lt!54896))))

(declare-fun bs!2921 () Bool)

(assert (= bs!2921 d!10904))

(declare-fun m!55829 () Bool)

(assert (=> bs!2921 m!55829))

(assert (=> b!36576 d!10904))

(declare-fun d!10906 () Bool)

(declare-fun e!24314 () Bool)

(assert (=> d!10906 e!24314))

(declare-fun c!2541 () Bool)

(assert (=> d!10906 (= c!2541 (= lt!54896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!55537 () List!445)

(declare-fun e!24313 () tuple2!3618)

(assert (=> d!10906 (= lt!55537 (_1!1896 e!24313))))

(declare-fun c!2540 () Bool)

(assert (=> d!10906 (= c!2540 (= lt!54896 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10906 (bvsge lt!54896 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10906 (= (bitStreamReadBitsIntoList!0 (_2!1890 lt!54886) (_1!1889 lt!54894) lt!54896) lt!55537)))

(declare-fun b!36906 () Bool)

(assert (=> b!36906 (= e!24314 (> (length!171 lt!55537) 0))))

(declare-fun b!36903 () Bool)

(assert (=> b!36903 (= e!24313 (tuple2!3619 Nil!442 (_1!1889 lt!54894)))))

(declare-fun b!36905 () Bool)

(assert (=> b!36905 (= e!24314 (isEmpty!102 lt!55537))))

(declare-fun lt!55535 () (_ BitVec 64))

(declare-fun lt!55536 () tuple2!3620)

(declare-fun b!36904 () Bool)

(assert (=> b!36904 (= e!24313 (tuple2!3619 (Cons!441 (_1!1897 lt!55536) (bitStreamReadBitsIntoList!0 (_2!1890 lt!54886) (_2!1897 lt!55536) (bvsub lt!54896 lt!55535))) (_2!1897 lt!55536)))))

(assert (=> b!36904 (= lt!55536 (readBit!0 (_1!1889 lt!54894)))))

(assert (=> b!36904 (= lt!55535 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!10906 c!2540) b!36903))

(assert (= (and d!10906 (not c!2540)) b!36904))

(assert (= (and d!10906 c!2541) b!36905))

(assert (= (and d!10906 (not c!2541)) b!36906))

(declare-fun m!55831 () Bool)

(assert (=> b!36906 m!55831))

(declare-fun m!55833 () Bool)

(assert (=> b!36905 m!55833))

(declare-fun m!55835 () Bool)

(assert (=> b!36904 m!55835))

(declare-fun m!55837 () Bool)

(assert (=> b!36904 m!55837))

(assert (=> b!36576 d!10906))

(declare-fun d!10908 () Bool)

(assert (=> d!10908 (= (bitAt!0 (buf!1188 (_2!1890 lt!54886)) lt!54900) (not (= (bvand ((_ sign_extend 24) (select (arr!1347 (buf!1188 (_2!1890 lt!54886))) ((_ extract 31 0) (bvsdiv lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2922 () Bool)

(assert (= bs!2922 d!10908))

(declare-fun m!55839 () Bool)

(assert (=> bs!2922 m!55839))

(assert (=> bs!2922 m!55763))

(assert (=> b!36587 d!10908))

(declare-fun d!10910 () Bool)

(assert (=> d!10910 (= (bitAt!0 (buf!1188 (_2!1890 lt!54893)) lt!54900) (bitAt!0 (buf!1188 (_2!1890 lt!54886)) lt!54900))))

(declare-fun lt!55540 () Unit!2671)

(declare-fun choose!31 (array!1924 array!1924 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2671)

(assert (=> d!10910 (= lt!55540 (choose!31 (buf!1188 (_2!1890 lt!54893)) (buf!1188 (_2!1890 lt!54886)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54900 lt!54889))))

(assert (=> d!10910 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!54889))))

(assert (=> d!10910 (= (arrayBitRangesEqImpliesEq!0 (buf!1188 (_2!1890 lt!54893)) (buf!1188 (_2!1890 lt!54886)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54900 lt!54889) lt!55540)))

(declare-fun bs!2923 () Bool)

(assert (= bs!2923 d!10910))

(assert (=> bs!2923 m!55255))

(assert (=> bs!2923 m!55191))

(declare-fun m!55841 () Bool)

(assert (=> bs!2923 m!55841))

(assert (=> b!36587 d!10910))

(declare-fun d!10912 () Bool)

(declare-fun res!31384 () Bool)

(declare-fun e!24315 () Bool)

(assert (=> d!10912 (=> (not res!31384) (not e!24315))))

(assert (=> d!10912 (= res!31384 (= (size!860 (buf!1188 thiss!1379)) (size!860 (buf!1188 thiss!1379))))))

(assert (=> d!10912 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!24315)))

(declare-fun b!36907 () Bool)

(declare-fun res!31382 () Bool)

(assert (=> b!36907 (=> (not res!31382) (not e!24315))))

(assert (=> b!36907 (= res!31382 (bvsle (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)) (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379))))))

(declare-fun b!36908 () Bool)

(declare-fun e!24316 () Bool)

(assert (=> b!36908 (= e!24315 e!24316)))

(declare-fun res!31383 () Bool)

(assert (=> b!36908 (=> res!31383 e!24316)))

(assert (=> b!36908 (= res!31383 (= (size!860 (buf!1188 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36909 () Bool)

(assert (=> b!36909 (= e!24316 (arrayBitRangesEq!0 (buf!1188 thiss!1379) (buf!1188 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379))))))

(assert (= (and d!10912 res!31384) b!36907))

(assert (= (and b!36907 res!31382) b!36908))

(assert (= (and b!36908 (not res!31383)) b!36909))

(assert (=> b!36907 m!55213))

(assert (=> b!36907 m!55213))

(assert (=> b!36909 m!55213))

(assert (=> b!36909 m!55213))

(declare-fun m!55843 () Bool)

(assert (=> b!36909 m!55843))

(assert (=> b!36583 d!10912))

(declare-fun d!10914 () Bool)

(assert (=> d!10914 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!55543 () Unit!2671)

(declare-fun choose!11 (BitStream!1488) Unit!2671)

(assert (=> d!10914 (= lt!55543 (choose!11 thiss!1379))))

(assert (=> d!10914 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!55543)))

(declare-fun bs!2925 () Bool)

(assert (= bs!2925 d!10914))

(assert (=> bs!2925 m!55209))

(declare-fun m!55845 () Bool)

(assert (=> bs!2925 m!55845))

(assert (=> b!36583 d!10914))

(declare-fun d!10916 () Bool)

(declare-fun e!24319 () Bool)

(assert (=> d!10916 e!24319))

(declare-fun res!31389 () Bool)

(assert (=> d!10916 (=> (not res!31389) (not e!24319))))

(declare-fun lt!55558 () (_ BitVec 64))

(declare-fun lt!55556 () (_ BitVec 64))

(declare-fun lt!55557 () (_ BitVec 64))

(assert (=> d!10916 (= res!31389 (= lt!55556 (bvsub lt!55557 lt!55558)))))

(assert (=> d!10916 (or (= (bvand lt!55557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55558 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55557 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55557 lt!55558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10916 (= lt!55558 (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 thiss!1379))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379))))))

(declare-fun lt!55561 () (_ BitVec 64))

(declare-fun lt!55560 () (_ BitVec 64))

(assert (=> d!10916 (= lt!55557 (bvmul lt!55561 lt!55560))))

(assert (=> d!10916 (or (= lt!55561 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!55560 (bvsdiv (bvmul lt!55561 lt!55560) lt!55561)))))

(assert (=> d!10916 (= lt!55560 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10916 (= lt!55561 ((_ sign_extend 32) (size!860 (buf!1188 thiss!1379))))))

(assert (=> d!10916 (= lt!55556 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2582 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2577 thiss!1379))))))

(assert (=> d!10916 (invariant!0 (currentBit!2577 thiss!1379) (currentByte!2582 thiss!1379) (size!860 (buf!1188 thiss!1379)))))

(assert (=> d!10916 (= (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)) lt!55556)))

(declare-fun b!36914 () Bool)

(declare-fun res!31390 () Bool)

(assert (=> b!36914 (=> (not res!31390) (not e!24319))))

(assert (=> b!36914 (= res!31390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!55556))))

(declare-fun b!36915 () Bool)

(declare-fun lt!55559 () (_ BitVec 64))

(assert (=> b!36915 (= e!24319 (bvsle lt!55556 (bvmul lt!55559 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36915 (or (= lt!55559 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!55559 #b0000000000000000000000000000000000000000000000000000000000001000) lt!55559)))))

(assert (=> b!36915 (= lt!55559 ((_ sign_extend 32) (size!860 (buf!1188 thiss!1379))))))

(assert (= (and d!10916 res!31389) b!36914))

(assert (= (and b!36914 res!31390) b!36915))

(declare-fun m!55847 () Bool)

(assert (=> d!10916 m!55847))

(declare-fun m!55849 () Bool)

(assert (=> d!10916 m!55849))

(assert (=> b!36583 d!10916))

(declare-fun d!10918 () Bool)

(assert (=> d!10918 (= (array_inv!797 (buf!1188 thiss!1379)) (bvsge (size!860 (buf!1188 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!36573 d!10918))

(declare-fun d!10920 () Bool)

(assert (=> d!10920 (= (bitAt!0 (buf!1188 (_2!1890 lt!54893)) lt!54900) (not (= (bvand ((_ sign_extend 24) (select (arr!1347 (buf!1188 (_2!1890 lt!54893))) ((_ extract 31 0) (bvsdiv lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!54900 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2926 () Bool)

(assert (= bs!2926 d!10920))

(declare-fun m!55851 () Bool)

(assert (=> bs!2926 m!55851))

(assert (=> bs!2926 m!55763))

(assert (=> b!36584 d!10920))

(declare-fun d!10922 () Bool)

(assert (=> d!10922 (= (invariant!0 (currentBit!2577 (_2!1890 lt!54886)) (currentByte!2582 (_2!1890 lt!54886)) (size!860 (buf!1188 (_2!1890 lt!54886)))) (and (bvsge (currentBit!2577 (_2!1890 lt!54886)) #b00000000000000000000000000000000) (bvslt (currentBit!2577 (_2!1890 lt!54886)) #b00000000000000000000000000001000) (bvsge (currentByte!2582 (_2!1890 lt!54886)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2582 (_2!1890 lt!54886)) (size!860 (buf!1188 (_2!1890 lt!54886)))) (and (= (currentBit!2577 (_2!1890 lt!54886)) #b00000000000000000000000000000000) (= (currentByte!2582 (_2!1890 lt!54886)) (size!860 (buf!1188 (_2!1890 lt!54886))))))))))

(assert (=> b!36574 d!10922))

(declare-fun d!10924 () Bool)

(assert (=> d!10924 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 thiss!1379))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 thiss!1379))) ((_ sign_extend 32) (currentByte!2582 thiss!1379)) ((_ sign_extend 32) (currentBit!2577 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2927 () Bool)

(assert (= bs!2927 d!10924))

(assert (=> bs!2927 m!55847))

(assert (=> b!36580 d!10924))

(declare-fun d!10926 () Bool)

(declare-fun size!862 (List!445) Int)

(assert (=> d!10926 (= (length!171 lt!54890) (size!862 lt!54890))))

(declare-fun bs!2928 () Bool)

(assert (= bs!2928 d!10926))

(declare-fun m!55853 () Bool)

(assert (=> bs!2928 m!55853))

(assert (=> b!36591 d!10926))

(declare-fun d!10928 () Bool)

(assert (=> d!10928 (= (tail!162 lt!54890) (t!1195 lt!54890))))

(assert (=> b!36581 d!10928))

(declare-fun d!10930 () Bool)

(declare-fun e!24322 () Bool)

(assert (=> d!10930 e!24322))

(declare-fun res!31393 () Bool)

(assert (=> d!10930 (=> (not res!31393) (not e!24322))))

(declare-fun lt!55567 () (_ BitVec 64))

(assert (=> d!10930 (= res!31393 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55567 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!55567) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10930 (= lt!55567 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!55566 () Unit!2671)

(declare-fun choose!42 (BitStream!1488 BitStream!1488 BitStream!1488 BitStream!1488 (_ BitVec 64) List!445) Unit!2671)

(assert (=> d!10930 (= lt!55566 (choose!42 (_2!1890 lt!54886) (_2!1890 lt!54886) (_1!1889 lt!54884) (_1!1889 lt!54894) (bvsub to!314 i!635) lt!54890))))

(assert (=> d!10930 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10930 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1890 lt!54886) (_2!1890 lt!54886) (_1!1889 lt!54884) (_1!1889 lt!54894) (bvsub to!314 i!635) lt!54890) lt!55566)))

(declare-fun b!36918 () Bool)

(assert (=> b!36918 (= e!24322 (= (bitStreamReadBitsIntoList!0 (_2!1890 lt!54886) (_1!1889 lt!54894) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!162 lt!54890)))))

(assert (= (and d!10930 res!31393) b!36918))

(declare-fun m!55855 () Bool)

(assert (=> d!10930 m!55855))

(declare-fun m!55857 () Bool)

(assert (=> b!36918 m!55857))

(assert (=> b!36918 m!55281))

(assert (=> b!36581 d!10930))

(declare-fun d!10932 () Bool)

(assert (=> d!10932 (= (head!282 lt!54890) (h!560 lt!54890))))

(assert (=> b!36592 d!10932))

(declare-fun d!10934 () Bool)

(assert (=> d!10934 (= (head!282 (byteArrayBitContentToList!0 (_2!1890 lt!54893) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!560 (byteArrayBitContentToList!0 (_2!1890 lt!54893) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!36571 d!10934))

(declare-fun d!10936 () Bool)

(declare-fun c!2542 () Bool)

(assert (=> d!10936 (= c!2542 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24323 () List!445)

(assert (=> d!10936 (= (byteArrayBitContentToList!0 (_2!1890 lt!54893) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!24323)))

(declare-fun b!36919 () Bool)

(assert (=> b!36919 (= e!24323 Nil!442)))

(declare-fun b!36920 () Bool)

(assert (=> b!36920 (= e!24323 (Cons!441 (not (= (bvand ((_ sign_extend 24) (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1890 lt!54893) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10936 c!2542) b!36919))

(assert (= (and d!10936 (not c!2542)) b!36920))

(assert (=> b!36920 m!55233))

(assert (=> b!36920 m!55383))

(declare-fun m!55859 () Bool)

(assert (=> b!36920 m!55859))

(assert (=> b!36571 d!10936))

(declare-fun d!10938 () Bool)

(assert (=> d!10938 (= (head!282 (bitStreamReadBitsIntoList!0 (_2!1890 lt!54893) (_1!1889 lt!54902) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!560 (bitStreamReadBitsIntoList!0 (_2!1890 lt!54893) (_1!1889 lt!54902) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!36571 d!10938))

(declare-fun d!10940 () Bool)

(declare-fun e!24325 () Bool)

(assert (=> d!10940 e!24325))

(declare-fun c!2544 () Bool)

(assert (=> d!10940 (= c!2544 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!55570 () List!445)

(declare-fun e!24324 () tuple2!3618)

(assert (=> d!10940 (= lt!55570 (_1!1896 e!24324))))

(declare-fun c!2543 () Bool)

(assert (=> d!10940 (= c!2543 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10940 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10940 (= (bitStreamReadBitsIntoList!0 (_2!1890 lt!54893) (_1!1889 lt!54902) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55570)))

(declare-fun b!36924 () Bool)

(assert (=> b!36924 (= e!24325 (> (length!171 lt!55570) 0))))

(declare-fun b!36921 () Bool)

(assert (=> b!36921 (= e!24324 (tuple2!3619 Nil!442 (_1!1889 lt!54902)))))

(declare-fun b!36923 () Bool)

(assert (=> b!36923 (= e!24325 (isEmpty!102 lt!55570))))

(declare-fun lt!55569 () tuple2!3620)

(declare-fun lt!55568 () (_ BitVec 64))

(declare-fun b!36922 () Bool)

(assert (=> b!36922 (= e!24324 (tuple2!3619 (Cons!441 (_1!1897 lt!55569) (bitStreamReadBitsIntoList!0 (_2!1890 lt!54893) (_2!1897 lt!55569) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!55568))) (_2!1897 lt!55569)))))

(assert (=> b!36922 (= lt!55569 (readBit!0 (_1!1889 lt!54902)))))

(assert (=> b!36922 (= lt!55568 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!10940 c!2543) b!36921))

(assert (= (and d!10940 (not c!2543)) b!36922))

(assert (= (and d!10940 c!2544) b!36923))

(assert (= (and d!10940 (not c!2544)) b!36924))

(declare-fun m!55861 () Bool)

(assert (=> b!36924 m!55861))

(declare-fun m!55863 () Bool)

(assert (=> b!36923 m!55863))

(declare-fun m!55865 () Bool)

(assert (=> b!36922 m!55865))

(declare-fun m!55867 () Bool)

(assert (=> b!36922 m!55867))

(assert (=> b!36571 d!10940))

(declare-fun d!10942 () Bool)

(declare-fun e!24326 () Bool)

(assert (=> d!10942 e!24326))

(declare-fun res!31394 () Bool)

(assert (=> d!10942 (=> (not res!31394) (not e!24326))))

(declare-fun lt!55571 () (_ BitVec 64))

(declare-fun lt!55573 () (_ BitVec 64))

(declare-fun lt!55572 () (_ BitVec 64))

(assert (=> d!10942 (= res!31394 (= lt!55571 (bvsub lt!55572 lt!55573)))))

(assert (=> d!10942 (or (= (bvand lt!55572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55573 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55572 lt!55573) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10942 (= lt!55573 (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893)))))))

(declare-fun lt!55576 () (_ BitVec 64))

(declare-fun lt!55575 () (_ BitVec 64))

(assert (=> d!10942 (= lt!55572 (bvmul lt!55576 lt!55575))))

(assert (=> d!10942 (or (= lt!55576 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!55575 (bvsdiv (bvmul lt!55576 lt!55575) lt!55576)))))

(assert (=> d!10942 (= lt!55575 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10942 (= lt!55576 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))))))

(assert (=> d!10942 (= lt!55571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893)))))))

(assert (=> d!10942 (invariant!0 (currentBit!2577 (_2!1890 lt!54893)) (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54893))))))

(assert (=> d!10942 (= (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893))) lt!55571)))

(declare-fun b!36925 () Bool)

(declare-fun res!31395 () Bool)

(assert (=> b!36925 (=> (not res!31395) (not e!24326))))

(assert (=> b!36925 (= res!31395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!55571))))

(declare-fun b!36926 () Bool)

(declare-fun lt!55574 () (_ BitVec 64))

(assert (=> b!36926 (= e!24326 (bvsle lt!55571 (bvmul lt!55574 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36926 (or (= lt!55574 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!55574 #b0000000000000000000000000000000000000000000000000000000000001000) lt!55574)))))

(assert (=> b!36926 (= lt!55574 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))))))

(assert (= (and d!10942 res!31394) b!36925))

(assert (= (and b!36925 res!31395) b!36926))

(declare-fun m!55869 () Bool)

(assert (=> d!10942 m!55869))

(assert (=> d!10942 m!55259))

(assert (=> b!36582 d!10942))

(declare-fun d!10944 () Bool)

(assert (=> d!10944 (= (invariant!0 (currentBit!2577 (_2!1890 lt!54893)) (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54893)))) (and (bvsge (currentBit!2577 (_2!1890 lt!54893)) #b00000000000000000000000000000000) (bvslt (currentBit!2577 (_2!1890 lt!54893)) #b00000000000000000000000000001000) (bvsge (currentByte!2582 (_2!1890 lt!54893)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54893)))) (and (= (currentBit!2577 (_2!1890 lt!54893)) #b00000000000000000000000000000000) (= (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54893))))))))))

(assert (=> b!36577 d!10944))

(declare-fun d!10946 () Bool)

(declare-fun e!24327 () Bool)

(assert (=> d!10946 e!24327))

(declare-fun res!31396 () Bool)

(assert (=> d!10946 (=> (not res!31396) (not e!24327))))

(declare-fun lt!55579 () (_ BitVec 64))

(declare-fun lt!55578 () (_ BitVec 64))

(declare-fun lt!55577 () (_ BitVec 64))

(assert (=> d!10946 (= res!31396 (= lt!55577 (bvsub lt!55578 lt!55579)))))

(assert (=> d!10946 (or (= (bvand lt!55578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!55578 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!55578 lt!55579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10946 (= lt!55579 (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54886))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54886)))))))

(declare-fun lt!55582 () (_ BitVec 64))

(declare-fun lt!55581 () (_ BitVec 64))

(assert (=> d!10946 (= lt!55578 (bvmul lt!55582 lt!55581))))

(assert (=> d!10946 (or (= lt!55582 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!55581 (bvsdiv (bvmul lt!55582 lt!55581) lt!55582)))))

(assert (=> d!10946 (= lt!55581 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10946 (= lt!55582 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))))))

(assert (=> d!10946 (= lt!55577 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54886))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54886)))))))

(assert (=> d!10946 (invariant!0 (currentBit!2577 (_2!1890 lt!54886)) (currentByte!2582 (_2!1890 lt!54886)) (size!860 (buf!1188 (_2!1890 lt!54886))))))

(assert (=> d!10946 (= (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54886))) (currentByte!2582 (_2!1890 lt!54886)) (currentBit!2577 (_2!1890 lt!54886))) lt!55577)))

(declare-fun b!36927 () Bool)

(declare-fun res!31397 () Bool)

(assert (=> b!36927 (=> (not res!31397) (not e!24327))))

(assert (=> b!36927 (= res!31397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!55577))))

(declare-fun b!36928 () Bool)

(declare-fun lt!55580 () (_ BitVec 64))

(assert (=> b!36928 (= e!24327 (bvsle lt!55577 (bvmul lt!55580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36928 (or (= lt!55580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!55580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!55580)))))

(assert (=> b!36928 (= lt!55580 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54886)))))))

(assert (= (and d!10946 res!31396) b!36927))

(assert (= (and b!36927 res!31397) b!36928))

(declare-fun m!55871 () Bool)

(assert (=> d!10946 m!55871))

(assert (=> d!10946 m!55263))

(assert (=> b!36588 d!10946))

(declare-fun d!10948 () Bool)

(assert (=> d!10948 (= (array_inv!797 srcBuffer!2) (bvsge (size!860 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7486 d!10948))

(declare-fun d!10950 () Bool)

(assert (=> d!10950 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2577 thiss!1379) (currentByte!2582 thiss!1379) (size!860 (buf!1188 thiss!1379))))))

(declare-fun bs!2929 () Bool)

(assert (= bs!2929 d!10950))

(assert (=> bs!2929 m!55849))

(assert (=> start!7486 d!10950))

(declare-fun d!10952 () Bool)

(declare-fun res!31400 () Bool)

(declare-fun e!24328 () Bool)

(assert (=> d!10952 (=> (not res!31400) (not e!24328))))

(assert (=> d!10952 (= res!31400 (= (size!860 (buf!1188 thiss!1379)) (size!860 (buf!1188 (_2!1890 lt!54893)))))))

(assert (=> d!10952 (= (isPrefixOf!0 thiss!1379 (_2!1890 lt!54893)) e!24328)))

(declare-fun b!36929 () Bool)

(declare-fun res!31398 () Bool)

(assert (=> b!36929 (=> (not res!31398) (not e!24328))))

(assert (=> b!36929 (= res!31398 (bvsle (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)) (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!54893))) (currentByte!2582 (_2!1890 lt!54893)) (currentBit!2577 (_2!1890 lt!54893)))))))

(declare-fun b!36930 () Bool)

(declare-fun e!24329 () Bool)

(assert (=> b!36930 (= e!24328 e!24329)))

(declare-fun res!31399 () Bool)

(assert (=> b!36930 (=> res!31399 e!24329)))

(assert (=> b!36930 (= res!31399 (= (size!860 (buf!1188 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36931 () Bool)

(assert (=> b!36931 (= e!24329 (arrayBitRangesEq!0 (buf!1188 thiss!1379) (buf!1188 (_2!1890 lt!54893)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379))))))

(assert (= (and d!10952 res!31400) b!36929))

(assert (= (and b!36929 res!31398) b!36930))

(assert (= (and b!36930 (not res!31399)) b!36931))

(assert (=> b!36929 m!55213))

(assert (=> b!36929 m!55201))

(assert (=> b!36931 m!55213))

(assert (=> b!36931 m!55213))

(declare-fun m!55873 () Bool)

(assert (=> b!36931 m!55873))

(assert (=> b!36578 d!10952))

(declare-fun d!10954 () Bool)

(assert (=> d!10954 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) lt!54896) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893)))) lt!54896))))

(declare-fun bs!2930 () Bool)

(assert (= bs!2930 d!10954))

(assert (=> bs!2930 m!55869))

(assert (=> b!36578 d!10954))

(declare-fun d!10956 () Bool)

(declare-fun e!24332 () Bool)

(assert (=> d!10956 e!24332))

(declare-fun res!31403 () Bool)

(assert (=> d!10956 (=> (not res!31403) (not e!24332))))

(assert (=> d!10956 (= res!31403 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!55585 () Unit!2671)

(declare-fun choose!27 (BitStream!1488 BitStream!1488 (_ BitVec 64) (_ BitVec 64)) Unit!2671)

(assert (=> d!10956 (= lt!55585 (choose!27 thiss!1379 (_2!1890 lt!54893) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10956 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10956 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1890 lt!54893) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!55585)))

(declare-fun b!36934 () Bool)

(assert (=> b!36934 (= e!24332 (validate_offset_bits!1 ((_ sign_extend 32) (size!860 (buf!1188 (_2!1890 lt!54893)))) ((_ sign_extend 32) (currentByte!2582 (_2!1890 lt!54893))) ((_ sign_extend 32) (currentBit!2577 (_2!1890 lt!54893))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10956 res!31403) b!36934))

(declare-fun m!55875 () Bool)

(assert (=> d!10956 m!55875))

(declare-fun m!55877 () Bool)

(assert (=> b!36934 m!55877))

(assert (=> b!36578 d!10956))

(declare-fun b!36952 () Bool)

(declare-fun res!31425 () Bool)

(declare-fun e!24342 () Bool)

(assert (=> b!36952 (=> (not res!31425) (not e!24342))))

(declare-fun lt!55621 () tuple2!3606)

(assert (=> b!36952 (= res!31425 (isPrefixOf!0 thiss!1379 (_2!1890 lt!55621)))))

(declare-fun b!36953 () Bool)

(declare-fun e!24344 () Bool)

(declare-fun e!24341 () Bool)

(assert (=> b!36953 (= e!24344 e!24341)))

(declare-fun res!31421 () Bool)

(assert (=> b!36953 (=> (not res!31421) (not e!24341))))

(declare-fun lt!55617 () tuple2!3608)

(declare-fun lt!55619 () (_ BitVec 8))

(declare-fun lt!55611 () tuple2!3606)

(assert (=> b!36953 (= res!31421 (and (= (_2!1891 lt!55617) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!55619)) #b00000000000000000000000000000000))) (= (_1!1891 lt!55617) (_2!1890 lt!55611))))))

(declare-fun lt!55612 () tuple2!3616)

(declare-fun lt!55618 () BitStream!1488)

(assert (=> b!36953 (= lt!55612 (readBits!0 lt!55618 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!36953 (= lt!55617 (readBitPure!0 lt!55618))))

(declare-fun readerFrom!0 (BitStream!1488 (_ BitVec 32) (_ BitVec 32)) BitStream!1488)

(assert (=> b!36953 (= lt!55618 (readerFrom!0 (_2!1890 lt!55611) (currentBit!2577 thiss!1379) (currentByte!2582 thiss!1379)))))

(declare-fun b!36954 () Bool)

(declare-fun res!31422 () Bool)

(assert (=> b!36954 (=> (not res!31422) (not e!24344))))

(assert (=> b!36954 (= res!31422 (isPrefixOf!0 thiss!1379 (_2!1890 lt!55611)))))

(declare-fun b!36955 () Bool)

(declare-fun e!24343 () Bool)

(assert (=> b!36955 (= e!24342 e!24343)))

(declare-fun res!31427 () Bool)

(assert (=> b!36955 (=> (not res!31427) (not e!24343))))

(declare-fun lt!55613 () tuple2!3608)

(declare-fun lt!55614 () Bool)

(assert (=> b!36955 (= res!31427 (and (= (_2!1891 lt!55613) lt!55614) (= (_1!1891 lt!55613) (_2!1890 lt!55621))))))

(assert (=> b!36955 (= lt!55613 (readBitPure!0 (readerFrom!0 (_2!1890 lt!55621) (currentBit!2577 thiss!1379) (currentByte!2582 thiss!1379))))))

(declare-fun d!10958 () Bool)

(assert (=> d!10958 e!24344))

(declare-fun res!31426 () Bool)

(assert (=> d!10958 (=> (not res!31426) (not e!24344))))

(assert (=> d!10958 (= res!31426 (= (size!860 (buf!1188 (_2!1890 lt!55611))) (size!860 (buf!1188 thiss!1379))))))

(declare-fun lt!55616 () array!1924)

(assert (=> d!10958 (= lt!55619 (select (arr!1347 lt!55616) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10958 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!860 lt!55616)))))

(assert (=> d!10958 (= lt!55616 (array!1925 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!55615 () tuple2!3606)

(assert (=> d!10958 (= lt!55611 (tuple2!3607 (_1!1890 lt!55615) (_2!1890 lt!55615)))))

(assert (=> d!10958 (= lt!55615 lt!55621)))

(assert (=> d!10958 e!24342))

(declare-fun res!31424 () Bool)

(assert (=> d!10958 (=> (not res!31424) (not e!24342))))

(assert (=> d!10958 (= res!31424 (= (size!860 (buf!1188 thiss!1379)) (size!860 (buf!1188 (_2!1890 lt!55621)))))))

(declare-fun appendBit!0 (BitStream!1488 Bool) tuple2!3606)

(assert (=> d!10958 (= lt!55621 (appendBit!0 thiss!1379 lt!55614))))

(assert (=> d!10958 (= lt!55614 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10958 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10958 (= (appendBitFromByte!0 thiss!1379 (select (arr!1347 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!55611)))

(declare-fun b!36956 () Bool)

(declare-fun res!31423 () Bool)

(assert (=> b!36956 (=> (not res!31423) (not e!24342))))

(assert (=> b!36956 (= res!31423 (= (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55621))) (currentByte!2582 (_2!1890 lt!55621)) (currentBit!2577 (_2!1890 lt!55621))) (bvadd (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!36957 () Bool)

(declare-fun res!31420 () Bool)

(assert (=> b!36957 (=> (not res!31420) (not e!24344))))

(declare-fun lt!55610 () (_ BitVec 64))

(declare-fun lt!55620 () (_ BitVec 64))

(assert (=> b!36957 (= res!31420 (= (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55611))) (currentByte!2582 (_2!1890 lt!55611)) (currentBit!2577 (_2!1890 lt!55611))) (bvadd lt!55620 lt!55610)))))

(assert (=> b!36957 (or (not (= (bvand lt!55620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!55610 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!55620 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!55620 lt!55610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36957 (= lt!55610 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!36957 (= lt!55620 (bitIndex!0 (size!860 (buf!1188 thiss!1379)) (currentByte!2582 thiss!1379) (currentBit!2577 thiss!1379)))))

(declare-fun b!36958 () Bool)

(assert (=> b!36958 (= e!24341 (= (bitIndex!0 (size!860 (buf!1188 (_1!1891 lt!55617))) (currentByte!2582 (_1!1891 lt!55617)) (currentBit!2577 (_1!1891 lt!55617))) (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55611))) (currentByte!2582 (_2!1890 lt!55611)) (currentBit!2577 (_2!1890 lt!55611)))))))

(declare-fun b!36959 () Bool)

(assert (=> b!36959 (= e!24343 (= (bitIndex!0 (size!860 (buf!1188 (_1!1891 lt!55613))) (currentByte!2582 (_1!1891 lt!55613)) (currentBit!2577 (_1!1891 lt!55613))) (bitIndex!0 (size!860 (buf!1188 (_2!1890 lt!55621))) (currentByte!2582 (_2!1890 lt!55621)) (currentBit!2577 (_2!1890 lt!55621)))))))

(assert (= (and d!10958 res!31424) b!36956))

(assert (= (and b!36956 res!31423) b!36952))

(assert (= (and b!36952 res!31425) b!36955))

(assert (= (and b!36955 res!31427) b!36959))

(assert (= (and d!10958 res!31426) b!36957))

(assert (= (and b!36957 res!31420) b!36954))

(assert (= (and b!36954 res!31422) b!36953))

(assert (= (and b!36953 res!31421) b!36958))

(declare-fun m!55879 () Bool)

(assert (=> b!36955 m!55879))

(assert (=> b!36955 m!55879))

(declare-fun m!55881 () Bool)

(assert (=> b!36955 m!55881))

(declare-fun m!55883 () Bool)

(assert (=> b!36952 m!55883))

(declare-fun m!55885 () Bool)

(assert (=> b!36958 m!55885))

(declare-fun m!55887 () Bool)

(assert (=> b!36958 m!55887))

(declare-fun m!55889 () Bool)

(assert (=> b!36959 m!55889))

(declare-fun m!55891 () Bool)

(assert (=> b!36959 m!55891))

(declare-fun m!55893 () Bool)

(assert (=> b!36953 m!55893))

(declare-fun m!55895 () Bool)

(assert (=> b!36953 m!55895))

(declare-fun m!55897 () Bool)

(assert (=> b!36953 m!55897))

(assert (=> b!36956 m!55891))

(assert (=> b!36956 m!55213))

(declare-fun m!55899 () Bool)

(assert (=> d!10958 m!55899))

(declare-fun m!55901 () Bool)

(assert (=> d!10958 m!55901))

(assert (=> d!10958 m!55383))

(assert (=> b!36957 m!55887))

(assert (=> b!36957 m!55213))

(declare-fun m!55903 () Bool)

(assert (=> b!36954 m!55903))

(assert (=> b!36578 d!10958))

(declare-fun d!10960 () Bool)

(declare-fun lt!55624 () tuple2!3620)

(assert (=> d!10960 (= lt!55624 (readBit!0 (_1!1889 lt!54884)))))

(assert (=> d!10960 (= (readBitPure!0 (_1!1889 lt!54884)) (tuple2!3609 (_2!1897 lt!55624) (_1!1897 lt!55624)))))

(declare-fun bs!2931 () Bool)

(assert (= bs!2931 d!10960))

(assert (=> bs!2931 m!55773))

(assert (=> b!36589 d!10960))

(declare-fun d!10962 () Bool)

(assert (=> d!10962 (= (invariant!0 (currentBit!2577 (_2!1890 lt!54893)) (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54886)))) (and (bvsge (currentBit!2577 (_2!1890 lt!54893)) #b00000000000000000000000000000000) (bvslt (currentBit!2577 (_2!1890 lt!54893)) #b00000000000000000000000000001000) (bvsge (currentByte!2582 (_2!1890 lt!54893)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54886)))) (and (= (currentBit!2577 (_2!1890 lt!54893)) #b00000000000000000000000000000000) (= (currentByte!2582 (_2!1890 lt!54893)) (size!860 (buf!1188 (_2!1890 lt!54886))))))))))

(assert (=> b!36579 d!10962))

(check-sat (not d!10754) (not b!36880) (not b!36873) (not d!10894) (not b!36878) (not b!36955) (not b!36922) (not b!36890) (not d!10904) (not d!10942) (not b!36954) (not b!36894) (not b!36897) (not b!36896) (not d!10958) (not b!36956) (not b!36876) (not d!10946) (not b!36958) (not b!36892) (not d!10930) (not b!36929) (not b!36900) (not bm!454) (not b!36671) (not b!36676) (not b!36902) (not b!36907) (not d!10896) (not b!36906) (not b!36934) (not b!36920) (not d!10956) (not b!36875) (not d!10746) (not b!36879) (not d!10910) (not b!36923) (not b!36953) (not d!10756) (not b!36931) (not b!36688) (not d!10902) (not d!10898) (not d!10914) (not b!36691) (not d!10960) (not b!36689) (not b!36899) (not d!10916) (not b!36959) (not b!36957) (not b!36924) (not b!36895) (not b!36918) (not b!36952) (not b!36891) (not b!36905) (not d!10752) (not d!10950) (not d!10900) (not b!36664) (not d!10926) (not d!10886) (not b!36909) (not d!10954) (not b!36673) (not b!36674) (not d!10924) (not b!36690) (not b!36901) (not b!36904))
