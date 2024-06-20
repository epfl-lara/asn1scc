; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27708 () Bool)

(assert start!27708)

(declare-fun b!142732 () Bool)

(declare-fun res!119161 () Bool)

(declare-fun e!95076 () Bool)

(assert (=> b!142732 (=> (not res!119161) (not e!95076))))

(declare-datatypes ((array!6531 0))(
  ( (array!6532 (arr!3675 (Array (_ BitVec 32) (_ BitVec 8))) (size!2956 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5170 0))(
  ( (BitStream!5171 (buf!3383 array!6531) (currentByte!6261 (_ BitVec 32)) (currentBit!6256 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5170)

(declare-datatypes ((Unit!8906 0))(
  ( (Unit!8907) )
))
(declare-datatypes ((tuple2!12676 0))(
  ( (tuple2!12677 (_1!6677 Unit!8906) (_2!6677 BitStream!5170)) )
))
(declare-fun lt!221286 () tuple2!12676)

(declare-fun isPrefixOf!0 (BitStream!5170 BitStream!5170) Bool)

(assert (=> b!142732 (= res!119161 (isPrefixOf!0 thiss!1634 (_2!6677 lt!221286)))))

(declare-fun b!142733 () Bool)

(declare-fun arr!237 () array!6531)

(declare-datatypes ((tuple2!12678 0))(
  ( (tuple2!12679 (_1!6678 BitStream!5170) (_2!6678 BitStream!5170)) )
))
(declare-fun lt!221273 () tuple2!12678)

(declare-fun e!95072 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!12680 0))(
  ( (tuple2!12681 (_1!6679 BitStream!5170) (_2!6679 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5170) tuple2!12680)

(assert (=> b!142733 (= e!95072 (not (= (_2!6679 (readBytePure!0 (_1!6678 lt!221273))) (select (arr!3675 arr!237) from!447))))))

(declare-fun lt!221284 () tuple2!12678)

(declare-fun lt!221281 () tuple2!12676)

(declare-fun reader!0 (BitStream!5170 BitStream!5170) tuple2!12678)

(assert (=> b!142733 (= lt!221284 (reader!0 (_2!6677 lt!221286) (_2!6677 lt!221281)))))

(assert (=> b!142733 (= lt!221273 (reader!0 thiss!1634 (_2!6677 lt!221281)))))

(declare-fun e!95078 () Bool)

(assert (=> b!142733 e!95078))

(declare-fun res!119160 () Bool)

(assert (=> b!142733 (=> (not res!119160) (not e!95078))))

(declare-fun lt!221277 () tuple2!12680)

(declare-fun lt!221276 () tuple2!12680)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!142733 (= res!119160 (= (bitIndex!0 (size!2956 (buf!3383 (_1!6679 lt!221277))) (currentByte!6261 (_1!6679 lt!221277)) (currentBit!6256 (_1!6679 lt!221277))) (bitIndex!0 (size!2956 (buf!3383 (_1!6679 lt!221276))) (currentByte!6261 (_1!6679 lt!221276)) (currentBit!6256 (_1!6679 lt!221276)))))))

(declare-fun lt!221282 () Unit!8906)

(declare-fun lt!221285 () BitStream!5170)

(declare-fun readBytePrefixLemma!0 (BitStream!5170 BitStream!5170) Unit!8906)

(assert (=> b!142733 (= lt!221282 (readBytePrefixLemma!0 lt!221285 (_2!6677 lt!221281)))))

(assert (=> b!142733 (= lt!221276 (readBytePure!0 (BitStream!5171 (buf!3383 (_2!6677 lt!221281)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634))))))

(assert (=> b!142733 (= lt!221277 (readBytePure!0 lt!221285))))

(assert (=> b!142733 (= lt!221285 (BitStream!5171 (buf!3383 (_2!6677 lt!221286)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(declare-fun e!95077 () Bool)

(assert (=> b!142733 e!95077))

(declare-fun res!119149 () Bool)

(assert (=> b!142733 (=> (not res!119149) (not e!95077))))

(assert (=> b!142733 (= res!119149 (isPrefixOf!0 thiss!1634 (_2!6677 lt!221281)))))

(declare-fun lt!221275 () Unit!8906)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5170 BitStream!5170 BitStream!5170) Unit!8906)

(assert (=> b!142733 (= lt!221275 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6677 lt!221286) (_2!6677 lt!221281)))))

(declare-fun e!95073 () Bool)

(assert (=> b!142733 e!95073))

(declare-fun res!119153 () Bool)

(assert (=> b!142733 (=> (not res!119153) (not e!95073))))

(assert (=> b!142733 (= res!119153 (= (size!2956 (buf!3383 (_2!6677 lt!221286))) (size!2956 (buf!3383 (_2!6677 lt!221281)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun appendByteArrayLoop!0 (BitStream!5170 array!6531 (_ BitVec 32) (_ BitVec 32)) tuple2!12676)

(assert (=> b!142733 (= lt!221281 (appendByteArrayLoop!0 (_2!6677 lt!221286) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!142733 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!221287 () Unit!8906)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5170 BitStream!5170 (_ BitVec 64) (_ BitVec 32)) Unit!8906)

(assert (=> b!142733 (= lt!221287 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6677 lt!221286) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!142733 e!95076))

(declare-fun res!119154 () Bool)

(assert (=> b!142733 (=> (not res!119154) (not e!95076))))

(assert (=> b!142733 (= res!119154 (= (size!2956 (buf!3383 thiss!1634)) (size!2956 (buf!3383 (_2!6677 lt!221286)))))))

(declare-fun appendByte!0 (BitStream!5170 (_ BitVec 8)) tuple2!12676)

(assert (=> b!142733 (= lt!221286 (appendByte!0 thiss!1634 (select (arr!3675 arr!237) from!447)))))

(declare-fun b!142734 () Bool)

(declare-fun res!119159 () Bool)

(assert (=> b!142734 (=> (not res!119159) (not e!95076))))

(assert (=> b!142734 (= res!119159 (= (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))))

(declare-fun b!142735 () Bool)

(declare-fun e!95074 () Bool)

(declare-fun e!95071 () Bool)

(assert (=> b!142735 (= e!95074 (not e!95071))))

(declare-fun res!119157 () Bool)

(assert (=> b!142735 (=> res!119157 e!95071)))

(declare-datatypes ((tuple2!12682 0))(
  ( (tuple2!12683 (_1!6680 BitStream!5170) (_2!6680 array!6531)) )
))
(declare-fun lt!221278 () tuple2!12682)

(declare-fun lt!221283 () tuple2!12678)

(assert (=> b!142735 (= res!119157 (or (not (= (size!2956 (_2!6680 lt!221278)) (size!2956 arr!237))) (not (= (_1!6680 lt!221278) (_2!6678 lt!221283)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5170 array!6531 (_ BitVec 32) (_ BitVec 32)) tuple2!12682)

(assert (=> b!142735 (= lt!221278 (readByteArrayLoopPure!0 (_1!6678 lt!221283) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!221280 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142735 (validate_offset_bits!1 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221281)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) lt!221280)))

(declare-fun lt!221288 () Unit!8906)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5170 array!6531 (_ BitVec 64)) Unit!8906)

(assert (=> b!142735 (= lt!221288 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6677 lt!221286) (buf!3383 (_2!6677 lt!221281)) lt!221280))))

(assert (=> b!142735 (= lt!221283 (reader!0 (_2!6677 lt!221286) (_2!6677 lt!221281)))))

(declare-fun res!119155 () Bool)

(assert (=> start!27708 (=> (not res!119155) (not e!95072))))

(assert (=> start!27708 (= res!119155 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2956 arr!237))))))

(assert (=> start!27708 e!95072))

(assert (=> start!27708 true))

(declare-fun array_inv!2745 (array!6531) Bool)

(assert (=> start!27708 (array_inv!2745 arr!237)))

(declare-fun e!95075 () Bool)

(declare-fun inv!12 (BitStream!5170) Bool)

(assert (=> start!27708 (and (inv!12 thiss!1634) e!95075)))

(declare-fun b!142736 () Bool)

(declare-fun res!119150 () Bool)

(assert (=> b!142736 (=> (not res!119150) (not e!95072))))

(assert (=> b!142736 (= res!119150 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2956 (buf!3383 thiss!1634))) ((_ sign_extend 32) (currentByte!6261 thiss!1634)) ((_ sign_extend 32) (currentBit!6256 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!142737 () Bool)

(assert (=> b!142737 (= e!95078 (= (_2!6679 lt!221277) (_2!6679 lt!221276)))))

(declare-fun lt!221274 () tuple2!12678)

(declare-fun lt!221279 () tuple2!12680)

(declare-fun b!142738 () Bool)

(assert (=> b!142738 (= e!95076 (and (= (_2!6679 lt!221279) (select (arr!3675 arr!237) from!447)) (= (_1!6679 lt!221279) (_2!6678 lt!221274))))))

(assert (=> b!142738 (= lt!221279 (readBytePure!0 (_1!6678 lt!221274)))))

(assert (=> b!142738 (= lt!221274 (reader!0 thiss!1634 (_2!6677 lt!221286)))))

(declare-fun b!142739 () Bool)

(declare-fun arrayRangesEq!272 (array!6531 array!6531 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142739 (= e!95071 (not (arrayRangesEq!272 arr!237 (_2!6680 lt!221278) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!142740 () Bool)

(declare-fun res!119156 () Bool)

(assert (=> b!142740 (=> (not res!119156) (not e!95072))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!142740 (= res!119156 (invariant!0 (currentBit!6256 thiss!1634) (currentByte!6261 thiss!1634) (size!2956 (buf!3383 thiss!1634))))))

(declare-fun b!142741 () Bool)

(declare-fun res!119151 () Bool)

(assert (=> b!142741 (=> (not res!119151) (not e!95074))))

(assert (=> b!142741 (= res!119151 (isPrefixOf!0 (_2!6677 lt!221286) (_2!6677 lt!221281)))))

(declare-fun b!142742 () Bool)

(assert (=> b!142742 (= e!95073 e!95074)))

(declare-fun res!119158 () Bool)

(assert (=> b!142742 (=> (not res!119158) (not e!95074))))

(assert (=> b!142742 (= res!119158 (= (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221281))) (currentByte!6261 (_2!6677 lt!221281)) (currentBit!6256 (_2!6677 lt!221281))) (bvadd (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!221280))))))

(assert (=> b!142742 (= lt!221280 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!142743 () Bool)

(assert (=> b!142743 (= e!95075 (array_inv!2745 (buf!3383 thiss!1634)))))

(declare-fun b!142744 () Bool)

(assert (=> b!142744 (= e!95077 (invariant!0 (currentBit!6256 thiss!1634) (currentByte!6261 thiss!1634) (size!2956 (buf!3383 (_2!6677 lt!221286)))))))

(declare-fun b!142745 () Bool)

(declare-fun res!119152 () Bool)

(assert (=> b!142745 (=> (not res!119152) (not e!95072))))

(assert (=> b!142745 (= res!119152 (bvslt from!447 to!404))))

(assert (= (and start!27708 res!119155) b!142736))

(assert (= (and b!142736 res!119150) b!142745))

(assert (= (and b!142745 res!119152) b!142740))

(assert (= (and b!142740 res!119156) b!142733))

(assert (= (and b!142733 res!119154) b!142734))

(assert (= (and b!142734 res!119159) b!142732))

(assert (= (and b!142732 res!119161) b!142738))

(assert (= (and b!142733 res!119153) b!142742))

(assert (= (and b!142742 res!119158) b!142741))

(assert (= (and b!142741 res!119151) b!142735))

(assert (= (and b!142735 (not res!119157)) b!142739))

(assert (= (and b!142733 res!119149) b!142744))

(assert (= (and b!142733 res!119160) b!142737))

(assert (= start!27708 b!142743))

(declare-fun m!219089 () Bool)

(assert (=> b!142740 m!219089))

(declare-fun m!219091 () Bool)

(assert (=> b!142735 m!219091))

(declare-fun m!219093 () Bool)

(assert (=> b!142735 m!219093))

(declare-fun m!219095 () Bool)

(assert (=> b!142735 m!219095))

(declare-fun m!219097 () Bool)

(assert (=> b!142735 m!219097))

(declare-fun m!219099 () Bool)

(assert (=> b!142733 m!219099))

(assert (=> b!142733 m!219097))

(declare-fun m!219101 () Bool)

(assert (=> b!142733 m!219101))

(declare-fun m!219103 () Bool)

(assert (=> b!142733 m!219103))

(declare-fun m!219105 () Bool)

(assert (=> b!142733 m!219105))

(declare-fun m!219107 () Bool)

(assert (=> b!142733 m!219107))

(declare-fun m!219109 () Bool)

(assert (=> b!142733 m!219109))

(declare-fun m!219111 () Bool)

(assert (=> b!142733 m!219111))

(assert (=> b!142733 m!219109))

(declare-fun m!219113 () Bool)

(assert (=> b!142733 m!219113))

(declare-fun m!219115 () Bool)

(assert (=> b!142733 m!219115))

(declare-fun m!219117 () Bool)

(assert (=> b!142733 m!219117))

(declare-fun m!219119 () Bool)

(assert (=> b!142733 m!219119))

(declare-fun m!219121 () Bool)

(assert (=> b!142733 m!219121))

(declare-fun m!219123 () Bool)

(assert (=> b!142733 m!219123))

(declare-fun m!219125 () Bool)

(assert (=> b!142733 m!219125))

(declare-fun m!219127 () Bool)

(assert (=> b!142732 m!219127))

(declare-fun m!219129 () Bool)

(assert (=> b!142736 m!219129))

(declare-fun m!219131 () Bool)

(assert (=> b!142734 m!219131))

(declare-fun m!219133 () Bool)

(assert (=> b!142734 m!219133))

(declare-fun m!219135 () Bool)

(assert (=> start!27708 m!219135))

(declare-fun m!219137 () Bool)

(assert (=> start!27708 m!219137))

(declare-fun m!219139 () Bool)

(assert (=> b!142743 m!219139))

(declare-fun m!219141 () Bool)

(assert (=> b!142744 m!219141))

(assert (=> b!142738 m!219109))

(declare-fun m!219143 () Bool)

(assert (=> b!142738 m!219143))

(declare-fun m!219145 () Bool)

(assert (=> b!142738 m!219145))

(declare-fun m!219147 () Bool)

(assert (=> b!142741 m!219147))

(declare-fun m!219149 () Bool)

(assert (=> b!142742 m!219149))

(assert (=> b!142742 m!219131))

(declare-fun m!219151 () Bool)

(assert (=> b!142739 m!219151))

(push 1)

(assert (not b!142744))

(assert (not b!142735))

(assert (not b!142738))

(assert (not b!142734))

(assert (not b!142743))

(assert (not b!142741))

(assert (not b!142736))

(assert (not b!142733))

(assert (not b!142732))

(assert (not b!142742))

(assert (not start!27708))

(assert (not b!142740))

(assert (not b!142739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45712 () Bool)

(assert (=> d!45712 (= (invariant!0 (currentBit!6256 thiss!1634) (currentByte!6261 thiss!1634) (size!2956 (buf!3383 (_2!6677 lt!221286)))) (and (bvsge (currentBit!6256 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6256 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6261 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6261 thiss!1634) (size!2956 (buf!3383 (_2!6677 lt!221286)))) (and (= (currentBit!6256 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6261 thiss!1634) (size!2956 (buf!3383 (_2!6677 lt!221286))))))))))

(assert (=> b!142744 d!45712))

(declare-fun d!45714 () Bool)

(declare-fun e!95148 () Bool)

(assert (=> d!45714 e!95148))

(declare-fun res!119250 () Bool)

(assert (=> d!45714 (=> (not res!119250) (not e!95148))))

(declare-fun lt!221397 () (_ BitVec 64))

(declare-fun lt!221398 () (_ BitVec 64))

(declare-fun lt!221401 () (_ BitVec 64))

(assert (=> d!45714 (= res!119250 (= lt!221397 (bvsub lt!221401 lt!221398)))))

(assert (=> d!45714 (or (= (bvand lt!221401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221398 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221401 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221401 lt!221398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45714 (= lt!221398 (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286)))))))

(declare-fun lt!221399 () (_ BitVec 64))

(declare-fun lt!221402 () (_ BitVec 64))

(assert (=> d!45714 (= lt!221401 (bvmul lt!221399 lt!221402))))

(assert (=> d!45714 (or (= lt!221399 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221402 (bvsdiv (bvmul lt!221399 lt!221402) lt!221399)))))

(assert (=> d!45714 (= lt!221402 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45714 (= lt!221399 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))))))

(assert (=> d!45714 (= lt!221397 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286)))))))

(assert (=> d!45714 (invariant!0 (currentBit!6256 (_2!6677 lt!221286)) (currentByte!6261 (_2!6677 lt!221286)) (size!2956 (buf!3383 (_2!6677 lt!221286))))))

(assert (=> d!45714 (= (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))) lt!221397)))

(declare-fun b!142840 () Bool)

(declare-fun res!119251 () Bool)

(assert (=> b!142840 (=> (not res!119251) (not e!95148))))

(assert (=> b!142840 (= res!119251 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221397))))

(declare-fun b!142841 () Bool)

(declare-fun lt!221400 () (_ BitVec 64))

(assert (=> b!142841 (= e!95148 (bvsle lt!221397 (bvmul lt!221400 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142841 (or (= lt!221400 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221400 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221400)))))

(assert (=> b!142841 (= lt!221400 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))))))

(assert (= (and d!45714 res!119250) b!142840))

(assert (= (and b!142840 res!119251) b!142841))

(declare-fun m!219287 () Bool)

(assert (=> d!45714 m!219287))

(declare-fun m!219289 () Bool)

(assert (=> d!45714 m!219289))

(assert (=> b!142734 d!45714))

(declare-fun d!45722 () Bool)

(declare-fun e!95149 () Bool)

(assert (=> d!45722 e!95149))

(declare-fun res!119252 () Bool)

(assert (=> d!45722 (=> (not res!119252) (not e!95149))))

(declare-fun lt!221407 () (_ BitVec 64))

(declare-fun lt!221403 () (_ BitVec 64))

(declare-fun lt!221404 () (_ BitVec 64))

(assert (=> d!45722 (= res!119252 (= lt!221403 (bvsub lt!221407 lt!221404)))))

(assert (=> d!45722 (or (= (bvand lt!221407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221404 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221407 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221407 lt!221404) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45722 (= lt!221404 (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 thiss!1634))) ((_ sign_extend 32) (currentByte!6261 thiss!1634)) ((_ sign_extend 32) (currentBit!6256 thiss!1634))))))

(declare-fun lt!221405 () (_ BitVec 64))

(declare-fun lt!221408 () (_ BitVec 64))

(assert (=> d!45722 (= lt!221407 (bvmul lt!221405 lt!221408))))

(assert (=> d!45722 (or (= lt!221405 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221408 (bvsdiv (bvmul lt!221405 lt!221408) lt!221405)))))

(assert (=> d!45722 (= lt!221408 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45722 (= lt!221405 ((_ sign_extend 32) (size!2956 (buf!3383 thiss!1634))))))

(assert (=> d!45722 (= lt!221403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6261 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6256 thiss!1634))))))

(assert (=> d!45722 (invariant!0 (currentBit!6256 thiss!1634) (currentByte!6261 thiss!1634) (size!2956 (buf!3383 thiss!1634)))))

(assert (=> d!45722 (= (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)) lt!221403)))

(declare-fun b!142842 () Bool)

(declare-fun res!119253 () Bool)

(assert (=> b!142842 (=> (not res!119253) (not e!95149))))

(assert (=> b!142842 (= res!119253 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221403))))

(declare-fun b!142843 () Bool)

(declare-fun lt!221406 () (_ BitVec 64))

(assert (=> b!142843 (= e!95149 (bvsle lt!221403 (bvmul lt!221406 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142843 (or (= lt!221406 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221406 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221406)))))

(assert (=> b!142843 (= lt!221406 ((_ sign_extend 32) (size!2956 (buf!3383 thiss!1634))))))

(assert (= (and d!45722 res!119252) b!142842))

(assert (= (and b!142842 res!119253) b!142843))

(declare-fun m!219291 () Bool)

(assert (=> d!45722 m!219291))

(assert (=> d!45722 m!219089))

(assert (=> b!142734 d!45722))

(declare-fun d!45724 () Bool)

(assert (=> d!45724 (= (array_inv!2745 arr!237) (bvsge (size!2956 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27708 d!45724))

(declare-fun d!45726 () Bool)

(assert (=> d!45726 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6256 thiss!1634) (currentByte!6261 thiss!1634) (size!2956 (buf!3383 thiss!1634))))))

(declare-fun bs!11222 () Bool)

(assert (= bs!11222 d!45726))

(assert (=> bs!11222 m!219089))

(assert (=> start!27708 d!45726))

(declare-fun d!45728 () Bool)

(declare-datatypes ((tuple3!548 0))(
  ( (tuple3!549 (_1!6689 Unit!8906) (_2!6689 BitStream!5170) (_3!339 array!6531)) )
))
(declare-fun lt!221414 () tuple3!548)

(declare-fun readByteArrayLoop!0 (BitStream!5170 array!6531 (_ BitVec 32) (_ BitVec 32)) tuple3!548)

(assert (=> d!45728 (= lt!221414 (readByteArrayLoop!0 (_1!6678 lt!221283) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45728 (= (readByteArrayLoopPure!0 (_1!6678 lt!221283) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12683 (_2!6689 lt!221414) (_3!339 lt!221414)))))

(declare-fun bs!11224 () Bool)

(assert (= bs!11224 d!45728))

(declare-fun m!219295 () Bool)

(assert (=> bs!11224 m!219295))

(assert (=> b!142735 d!45728))

(declare-fun d!45732 () Bool)

(assert (=> d!45732 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221281)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) lt!221280) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221281)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286)))) lt!221280))))

(declare-fun bs!11225 () Bool)

(assert (= bs!11225 d!45732))

(declare-fun m!219297 () Bool)

(assert (=> bs!11225 m!219297))

(assert (=> b!142735 d!45732))

(declare-fun d!45734 () Bool)

(assert (=> d!45734 (validate_offset_bits!1 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221281)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) lt!221280)))

(declare-fun lt!221417 () Unit!8906)

(declare-fun choose!9 (BitStream!5170 array!6531 (_ BitVec 64) BitStream!5170) Unit!8906)

(assert (=> d!45734 (= lt!221417 (choose!9 (_2!6677 lt!221286) (buf!3383 (_2!6677 lt!221281)) lt!221280 (BitStream!5171 (buf!3383 (_2!6677 lt!221281)) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286)))))))

(assert (=> d!45734 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6677 lt!221286) (buf!3383 (_2!6677 lt!221281)) lt!221280) lt!221417)))

(declare-fun bs!11226 () Bool)

(assert (= bs!11226 d!45734))

(assert (=> bs!11226 m!219093))

(declare-fun m!219299 () Bool)

(assert (=> bs!11226 m!219299))

(assert (=> b!142735 d!45734))

(declare-fun b!142869 () Bool)

(declare-fun res!119277 () Bool)

(declare-fun e!95164 () Bool)

(assert (=> b!142869 (=> (not res!119277) (not e!95164))))

(declare-fun lt!221484 () tuple2!12678)

(assert (=> b!142869 (= res!119277 (isPrefixOf!0 (_1!6678 lt!221484) (_2!6677 lt!221286)))))

(declare-fun d!45736 () Bool)

(assert (=> d!45736 e!95164))

(declare-fun res!119275 () Bool)

(assert (=> d!45736 (=> (not res!119275) (not e!95164))))

(assert (=> d!45736 (= res!119275 (isPrefixOf!0 (_1!6678 lt!221484) (_2!6678 lt!221484)))))

(declare-fun lt!221477 () BitStream!5170)

(assert (=> d!45736 (= lt!221484 (tuple2!12679 lt!221477 (_2!6677 lt!221281)))))

(declare-fun lt!221492 () Unit!8906)

(declare-fun lt!221485 () Unit!8906)

(assert (=> d!45736 (= lt!221492 lt!221485)))

(assert (=> d!45736 (isPrefixOf!0 lt!221477 (_2!6677 lt!221281))))

(assert (=> d!45736 (= lt!221485 (lemmaIsPrefixTransitive!0 lt!221477 (_2!6677 lt!221281) (_2!6677 lt!221281)))))

(declare-fun lt!221478 () Unit!8906)

(declare-fun lt!221489 () Unit!8906)

(assert (=> d!45736 (= lt!221478 lt!221489)))

(assert (=> d!45736 (isPrefixOf!0 lt!221477 (_2!6677 lt!221281))))

(assert (=> d!45736 (= lt!221489 (lemmaIsPrefixTransitive!0 lt!221477 (_2!6677 lt!221286) (_2!6677 lt!221281)))))

(declare-fun lt!221490 () Unit!8906)

(declare-fun e!95163 () Unit!8906)

(assert (=> d!45736 (= lt!221490 e!95163)))

(declare-fun c!7835 () Bool)

(assert (=> d!45736 (= c!7835 (not (= (size!2956 (buf!3383 (_2!6677 lt!221286))) #b00000000000000000000000000000000)))))

(declare-fun lt!221487 () Unit!8906)

(declare-fun lt!221483 () Unit!8906)

(assert (=> d!45736 (= lt!221487 lt!221483)))

(assert (=> d!45736 (isPrefixOf!0 (_2!6677 lt!221281) (_2!6677 lt!221281))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5170) Unit!8906)

(assert (=> d!45736 (= lt!221483 (lemmaIsPrefixRefl!0 (_2!6677 lt!221281)))))

(declare-fun lt!221486 () Unit!8906)

(declare-fun lt!221491 () Unit!8906)

(assert (=> d!45736 (= lt!221486 lt!221491)))

(assert (=> d!45736 (= lt!221491 (lemmaIsPrefixRefl!0 (_2!6677 lt!221281)))))

(declare-fun lt!221495 () Unit!8906)

(declare-fun lt!221496 () Unit!8906)

(assert (=> d!45736 (= lt!221495 lt!221496)))

(assert (=> d!45736 (isPrefixOf!0 lt!221477 lt!221477)))

(assert (=> d!45736 (= lt!221496 (lemmaIsPrefixRefl!0 lt!221477))))

(declare-fun lt!221494 () Unit!8906)

(declare-fun lt!221481 () Unit!8906)

(assert (=> d!45736 (= lt!221494 lt!221481)))

(assert (=> d!45736 (isPrefixOf!0 (_2!6677 lt!221286) (_2!6677 lt!221286))))

(assert (=> d!45736 (= lt!221481 (lemmaIsPrefixRefl!0 (_2!6677 lt!221286)))))

(assert (=> d!45736 (= lt!221477 (BitStream!5171 (buf!3383 (_2!6677 lt!221281)) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))))))

(assert (=> d!45736 (isPrefixOf!0 (_2!6677 lt!221286) (_2!6677 lt!221281))))

(assert (=> d!45736 (= (reader!0 (_2!6677 lt!221286) (_2!6677 lt!221281)) lt!221484)))

(declare-fun b!142870 () Bool)

(declare-fun Unit!8912 () Unit!8906)

(assert (=> b!142870 (= e!95163 Unit!8912)))

(declare-fun b!142871 () Bool)

(declare-fun lt!221488 () Unit!8906)

(assert (=> b!142871 (= e!95163 lt!221488)))

(declare-fun lt!221480 () (_ BitVec 64))

(assert (=> b!142871 (= lt!221480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221493 () (_ BitVec 64))

(assert (=> b!142871 (= lt!221493 (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6531 array!6531 (_ BitVec 64) (_ BitVec 64)) Unit!8906)

(assert (=> b!142871 (= lt!221488 (arrayBitRangesEqSymmetric!0 (buf!3383 (_2!6677 lt!221286)) (buf!3383 (_2!6677 lt!221281)) lt!221480 lt!221493))))

(declare-fun arrayBitRangesEq!0 (array!6531 array!6531 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!142871 (arrayBitRangesEq!0 (buf!3383 (_2!6677 lt!221281)) (buf!3383 (_2!6677 lt!221286)) lt!221480 lt!221493)))

(declare-fun b!142872 () Bool)

(declare-fun lt!221482 () (_ BitVec 64))

(declare-fun lt!221479 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5170 (_ BitVec 64)) BitStream!5170)

(assert (=> b!142872 (= e!95164 (= (_1!6678 lt!221484) (withMovedBitIndex!0 (_2!6678 lt!221484) (bvsub lt!221482 lt!221479))))))

(assert (=> b!142872 (or (= (bvand lt!221482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221479 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221482 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221482 lt!221479) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142872 (= lt!221479 (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221281))) (currentByte!6261 (_2!6677 lt!221281)) (currentBit!6256 (_2!6677 lt!221281))))))

(assert (=> b!142872 (= lt!221482 (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))))))

(declare-fun b!142873 () Bool)

(declare-fun res!119276 () Bool)

(assert (=> b!142873 (=> (not res!119276) (not e!95164))))

(assert (=> b!142873 (= res!119276 (isPrefixOf!0 (_2!6678 lt!221484) (_2!6677 lt!221281)))))

(assert (= (and d!45736 c!7835) b!142871))

(assert (= (and d!45736 (not c!7835)) b!142870))

(assert (= (and d!45736 res!119275) b!142869))

(assert (= (and b!142869 res!119277) b!142873))

(assert (= (and b!142873 res!119276) b!142872))

(assert (=> b!142871 m!219131))

(declare-fun m!219309 () Bool)

(assert (=> b!142871 m!219309))

(declare-fun m!219311 () Bool)

(assert (=> b!142871 m!219311))

(declare-fun m!219313 () Bool)

(assert (=> b!142872 m!219313))

(assert (=> b!142872 m!219149))

(assert (=> b!142872 m!219131))

(declare-fun m!219315 () Bool)

(assert (=> b!142873 m!219315))

(declare-fun m!219317 () Bool)

(assert (=> b!142869 m!219317))

(declare-fun m!219319 () Bool)

(assert (=> d!45736 m!219319))

(declare-fun m!219321 () Bool)

(assert (=> d!45736 m!219321))

(declare-fun m!219323 () Bool)

(assert (=> d!45736 m!219323))

(declare-fun m!219325 () Bool)

(assert (=> d!45736 m!219325))

(declare-fun m!219327 () Bool)

(assert (=> d!45736 m!219327))

(declare-fun m!219329 () Bool)

(assert (=> d!45736 m!219329))

(assert (=> d!45736 m!219147))

(declare-fun m!219331 () Bool)

(assert (=> d!45736 m!219331))

(declare-fun m!219333 () Bool)

(assert (=> d!45736 m!219333))

(declare-fun m!219335 () Bool)

(assert (=> d!45736 m!219335))

(declare-fun m!219337 () Bool)

(assert (=> d!45736 m!219337))

(assert (=> b!142735 d!45736))

(declare-fun d!45744 () Bool)

(assert (=> d!45744 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2956 (buf!3383 thiss!1634))) ((_ sign_extend 32) (currentByte!6261 thiss!1634)) ((_ sign_extend 32) (currentBit!6256 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 thiss!1634))) ((_ sign_extend 32) (currentByte!6261 thiss!1634)) ((_ sign_extend 32) (currentBit!6256 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11228 () Bool)

(assert (= bs!11228 d!45744))

(assert (=> bs!11228 m!219291))

(assert (=> b!142736 d!45744))

(declare-fun d!45746 () Bool)

(declare-datatypes ((tuple2!12702 0))(
  ( (tuple2!12703 (_1!6691 (_ BitVec 8)) (_2!6691 BitStream!5170)) )
))
(declare-fun lt!221499 () tuple2!12702)

(declare-fun readByte!0 (BitStream!5170) tuple2!12702)

(assert (=> d!45746 (= lt!221499 (readByte!0 (_1!6678 lt!221274)))))

(assert (=> d!45746 (= (readBytePure!0 (_1!6678 lt!221274)) (tuple2!12681 (_2!6691 lt!221499) (_1!6691 lt!221499)))))

(declare-fun bs!11229 () Bool)

(assert (= bs!11229 d!45746))

(declare-fun m!219339 () Bool)

(assert (=> bs!11229 m!219339))

(assert (=> b!142738 d!45746))

(declare-fun b!142874 () Bool)

(declare-fun res!119280 () Bool)

(declare-fun e!95166 () Bool)

(assert (=> b!142874 (=> (not res!119280) (not e!95166))))

(declare-fun lt!221507 () tuple2!12678)

(assert (=> b!142874 (= res!119280 (isPrefixOf!0 (_1!6678 lt!221507) thiss!1634))))

(declare-fun d!45748 () Bool)

(assert (=> d!45748 e!95166))

(declare-fun res!119278 () Bool)

(assert (=> d!45748 (=> (not res!119278) (not e!95166))))

(assert (=> d!45748 (= res!119278 (isPrefixOf!0 (_1!6678 lt!221507) (_2!6678 lt!221507)))))

(declare-fun lt!221500 () BitStream!5170)

(assert (=> d!45748 (= lt!221507 (tuple2!12679 lt!221500 (_2!6677 lt!221286)))))

(declare-fun lt!221515 () Unit!8906)

(declare-fun lt!221508 () Unit!8906)

(assert (=> d!45748 (= lt!221515 lt!221508)))

(assert (=> d!45748 (isPrefixOf!0 lt!221500 (_2!6677 lt!221286))))

(assert (=> d!45748 (= lt!221508 (lemmaIsPrefixTransitive!0 lt!221500 (_2!6677 lt!221286) (_2!6677 lt!221286)))))

(declare-fun lt!221501 () Unit!8906)

(declare-fun lt!221512 () Unit!8906)

(assert (=> d!45748 (= lt!221501 lt!221512)))

(assert (=> d!45748 (isPrefixOf!0 lt!221500 (_2!6677 lt!221286))))

(assert (=> d!45748 (= lt!221512 (lemmaIsPrefixTransitive!0 lt!221500 thiss!1634 (_2!6677 lt!221286)))))

(declare-fun lt!221513 () Unit!8906)

(declare-fun e!95165 () Unit!8906)

(assert (=> d!45748 (= lt!221513 e!95165)))

(declare-fun c!7836 () Bool)

(assert (=> d!45748 (= c!7836 (not (= (size!2956 (buf!3383 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!221510 () Unit!8906)

(declare-fun lt!221506 () Unit!8906)

(assert (=> d!45748 (= lt!221510 lt!221506)))

(assert (=> d!45748 (isPrefixOf!0 (_2!6677 lt!221286) (_2!6677 lt!221286))))

(assert (=> d!45748 (= lt!221506 (lemmaIsPrefixRefl!0 (_2!6677 lt!221286)))))

(declare-fun lt!221509 () Unit!8906)

(declare-fun lt!221514 () Unit!8906)

(assert (=> d!45748 (= lt!221509 lt!221514)))

(assert (=> d!45748 (= lt!221514 (lemmaIsPrefixRefl!0 (_2!6677 lt!221286)))))

(declare-fun lt!221518 () Unit!8906)

(declare-fun lt!221519 () Unit!8906)

(assert (=> d!45748 (= lt!221518 lt!221519)))

(assert (=> d!45748 (isPrefixOf!0 lt!221500 lt!221500)))

(assert (=> d!45748 (= lt!221519 (lemmaIsPrefixRefl!0 lt!221500))))

(declare-fun lt!221517 () Unit!8906)

(declare-fun lt!221504 () Unit!8906)

(assert (=> d!45748 (= lt!221517 lt!221504)))

(assert (=> d!45748 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45748 (= lt!221504 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45748 (= lt!221500 (BitStream!5171 (buf!3383 (_2!6677 lt!221286)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(assert (=> d!45748 (isPrefixOf!0 thiss!1634 (_2!6677 lt!221286))))

(assert (=> d!45748 (= (reader!0 thiss!1634 (_2!6677 lt!221286)) lt!221507)))

(declare-fun b!142875 () Bool)

(declare-fun Unit!8914 () Unit!8906)

(assert (=> b!142875 (= e!95165 Unit!8914)))

(declare-fun b!142876 () Bool)

(declare-fun lt!221511 () Unit!8906)

(assert (=> b!142876 (= e!95165 lt!221511)))

(declare-fun lt!221503 () (_ BitVec 64))

(assert (=> b!142876 (= lt!221503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221516 () (_ BitVec 64))

(assert (=> b!142876 (= lt!221516 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(assert (=> b!142876 (= lt!221511 (arrayBitRangesEqSymmetric!0 (buf!3383 thiss!1634) (buf!3383 (_2!6677 lt!221286)) lt!221503 lt!221516))))

(assert (=> b!142876 (arrayBitRangesEq!0 (buf!3383 (_2!6677 lt!221286)) (buf!3383 thiss!1634) lt!221503 lt!221516)))

(declare-fun lt!221505 () (_ BitVec 64))

(declare-fun lt!221502 () (_ BitVec 64))

(declare-fun b!142877 () Bool)

(assert (=> b!142877 (= e!95166 (= (_1!6678 lt!221507) (withMovedBitIndex!0 (_2!6678 lt!221507) (bvsub lt!221505 lt!221502))))))

(assert (=> b!142877 (or (= (bvand lt!221505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221502 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221505 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221505 lt!221502) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142877 (= lt!221502 (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))))))

(assert (=> b!142877 (= lt!221505 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(declare-fun b!142878 () Bool)

(declare-fun res!119279 () Bool)

(assert (=> b!142878 (=> (not res!119279) (not e!95166))))

(assert (=> b!142878 (= res!119279 (isPrefixOf!0 (_2!6678 lt!221507) (_2!6677 lt!221286)))))

(assert (= (and d!45748 c!7836) b!142876))

(assert (= (and d!45748 (not c!7836)) b!142875))

(assert (= (and d!45748 res!119278) b!142874))

(assert (= (and b!142874 res!119280) b!142878))

(assert (= (and b!142878 res!119279) b!142877))

(assert (=> b!142876 m!219133))

(declare-fun m!219341 () Bool)

(assert (=> b!142876 m!219341))

(declare-fun m!219343 () Bool)

(assert (=> b!142876 m!219343))

(declare-fun m!219345 () Bool)

(assert (=> b!142877 m!219345))

(assert (=> b!142877 m!219131))

(assert (=> b!142877 m!219133))

(declare-fun m!219347 () Bool)

(assert (=> b!142878 m!219347))

(declare-fun m!219349 () Bool)

(assert (=> b!142874 m!219349))

(assert (=> d!45748 m!219325))

(declare-fun m!219351 () Bool)

(assert (=> d!45748 m!219351))

(declare-fun m!219353 () Bool)

(assert (=> d!45748 m!219353))

(declare-fun m!219355 () Bool)

(assert (=> d!45748 m!219355))

(declare-fun m!219357 () Bool)

(assert (=> d!45748 m!219357))

(declare-fun m!219359 () Bool)

(assert (=> d!45748 m!219359))

(assert (=> d!45748 m!219127))

(declare-fun m!219361 () Bool)

(assert (=> d!45748 m!219361))

(declare-fun m!219363 () Bool)

(assert (=> d!45748 m!219363))

(declare-fun m!219365 () Bool)

(assert (=> d!45748 m!219365))

(assert (=> d!45748 m!219333))

(assert (=> b!142738 d!45748))

(declare-fun d!45750 () Bool)

(declare-fun res!119285 () Bool)

(declare-fun e!95171 () Bool)

(assert (=> d!45750 (=> res!119285 e!95171)))

(assert (=> d!45750 (= res!119285 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45750 (= (arrayRangesEq!272 arr!237 (_2!6680 lt!221278) #b00000000000000000000000000000000 to!404) e!95171)))

(declare-fun b!142883 () Bool)

(declare-fun e!95172 () Bool)

(assert (=> b!142883 (= e!95171 e!95172)))

(declare-fun res!119286 () Bool)

(assert (=> b!142883 (=> (not res!119286) (not e!95172))))

(assert (=> b!142883 (= res!119286 (= (select (arr!3675 arr!237) #b00000000000000000000000000000000) (select (arr!3675 (_2!6680 lt!221278)) #b00000000000000000000000000000000)))))

(declare-fun b!142884 () Bool)

(assert (=> b!142884 (= e!95172 (arrayRangesEq!272 arr!237 (_2!6680 lt!221278) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45750 (not res!119285)) b!142883))

(assert (= (and b!142883 res!119286) b!142884))

(declare-fun m!219367 () Bool)

(assert (=> b!142883 m!219367))

(declare-fun m!219369 () Bool)

(assert (=> b!142883 m!219369))

(declare-fun m!219371 () Bool)

(assert (=> b!142884 m!219371))

(assert (=> b!142739 d!45750))

(declare-fun d!45752 () Bool)

(assert (=> d!45752 (= (invariant!0 (currentBit!6256 thiss!1634) (currentByte!6261 thiss!1634) (size!2956 (buf!3383 thiss!1634))) (and (bvsge (currentBit!6256 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6256 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6261 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6261 thiss!1634) (size!2956 (buf!3383 thiss!1634))) (and (= (currentBit!6256 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6261 thiss!1634) (size!2956 (buf!3383 thiss!1634)))))))))

(assert (=> b!142740 d!45752))

(declare-fun d!45754 () Bool)

(declare-fun res!119293 () Bool)

(declare-fun e!95177 () Bool)

(assert (=> d!45754 (=> (not res!119293) (not e!95177))))

(assert (=> d!45754 (= res!119293 (= (size!2956 (buf!3383 (_2!6677 lt!221286))) (size!2956 (buf!3383 (_2!6677 lt!221281)))))))

(assert (=> d!45754 (= (isPrefixOf!0 (_2!6677 lt!221286) (_2!6677 lt!221281)) e!95177)))

(declare-fun b!142891 () Bool)

(declare-fun res!119294 () Bool)

(assert (=> b!142891 (=> (not res!119294) (not e!95177))))

(assert (=> b!142891 (= res!119294 (bvsle (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))) (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221281))) (currentByte!6261 (_2!6677 lt!221281)) (currentBit!6256 (_2!6677 lt!221281)))))))

(declare-fun b!142892 () Bool)

(declare-fun e!95178 () Bool)

(assert (=> b!142892 (= e!95177 e!95178)))

(declare-fun res!119295 () Bool)

(assert (=> b!142892 (=> res!119295 e!95178)))

(assert (=> b!142892 (= res!119295 (= (size!2956 (buf!3383 (_2!6677 lt!221286))) #b00000000000000000000000000000000))))

(declare-fun b!142893 () Bool)

(assert (=> b!142893 (= e!95178 (arrayBitRangesEq!0 (buf!3383 (_2!6677 lt!221286)) (buf!3383 (_2!6677 lt!221281)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286)))))))

(assert (= (and d!45754 res!119293) b!142891))

(assert (= (and b!142891 res!119294) b!142892))

(assert (= (and b!142892 (not res!119295)) b!142893))

(assert (=> b!142891 m!219131))

(assert (=> b!142891 m!219149))

(assert (=> b!142893 m!219131))

(assert (=> b!142893 m!219131))

(declare-fun m!219373 () Bool)

(assert (=> b!142893 m!219373))

(assert (=> b!142741 d!45754))

(declare-fun d!45756 () Bool)

(declare-fun e!95179 () Bool)

(assert (=> d!45756 e!95179))

(declare-fun res!119296 () Bool)

(assert (=> d!45756 (=> (not res!119296) (not e!95179))))

(declare-fun lt!221520 () (_ BitVec 64))

(declare-fun lt!221521 () (_ BitVec 64))

(declare-fun lt!221524 () (_ BitVec 64))

(assert (=> d!45756 (= res!119296 (= lt!221520 (bvsub lt!221524 lt!221521)))))

(assert (=> d!45756 (or (= (bvand lt!221524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221524 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221524 lt!221521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45756 (= lt!221521 (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221281)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221281))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221281)))))))

(declare-fun lt!221522 () (_ BitVec 64))

(declare-fun lt!221525 () (_ BitVec 64))

(assert (=> d!45756 (= lt!221524 (bvmul lt!221522 lt!221525))))

(assert (=> d!45756 (or (= lt!221522 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221525 (bvsdiv (bvmul lt!221522 lt!221525) lt!221522)))))

(assert (=> d!45756 (= lt!221525 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45756 (= lt!221522 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221281)))))))

(assert (=> d!45756 (= lt!221520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221281))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221281)))))))

(assert (=> d!45756 (invariant!0 (currentBit!6256 (_2!6677 lt!221281)) (currentByte!6261 (_2!6677 lt!221281)) (size!2956 (buf!3383 (_2!6677 lt!221281))))))

(assert (=> d!45756 (= (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221281))) (currentByte!6261 (_2!6677 lt!221281)) (currentBit!6256 (_2!6677 lt!221281))) lt!221520)))

(declare-fun b!142894 () Bool)

(declare-fun res!119297 () Bool)

(assert (=> b!142894 (=> (not res!119297) (not e!95179))))

(assert (=> b!142894 (= res!119297 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221520))))

(declare-fun b!142895 () Bool)

(declare-fun lt!221523 () (_ BitVec 64))

(assert (=> b!142895 (= e!95179 (bvsle lt!221520 (bvmul lt!221523 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142895 (or (= lt!221523 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221523 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221523)))))

(assert (=> b!142895 (= lt!221523 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221281)))))))

(assert (= (and d!45756 res!119296) b!142894))

(assert (= (and b!142894 res!119297) b!142895))

(declare-fun m!219375 () Bool)

(assert (=> d!45756 m!219375))

(declare-fun m!219377 () Bool)

(assert (=> d!45756 m!219377))

(assert (=> b!142742 d!45756))

(assert (=> b!142742 d!45714))

(declare-fun d!45758 () Bool)

(declare-fun res!119298 () Bool)

(declare-fun e!95180 () Bool)

(assert (=> d!45758 (=> (not res!119298) (not e!95180))))

(assert (=> d!45758 (= res!119298 (= (size!2956 (buf!3383 thiss!1634)) (size!2956 (buf!3383 (_2!6677 lt!221286)))))))

(assert (=> d!45758 (= (isPrefixOf!0 thiss!1634 (_2!6677 lt!221286)) e!95180)))

(declare-fun b!142896 () Bool)

(declare-fun res!119299 () Bool)

(assert (=> b!142896 (=> (not res!119299) (not e!95180))))

(assert (=> b!142896 (= res!119299 (bvsle (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)) (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286)))))))

(declare-fun b!142897 () Bool)

(declare-fun e!95181 () Bool)

(assert (=> b!142897 (= e!95180 e!95181)))

(declare-fun res!119300 () Bool)

(assert (=> b!142897 (=> res!119300 e!95181)))

(assert (=> b!142897 (= res!119300 (= (size!2956 (buf!3383 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142898 () Bool)

(assert (=> b!142898 (= e!95181 (arrayBitRangesEq!0 (buf!3383 thiss!1634) (buf!3383 (_2!6677 lt!221286)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634))))))

(assert (= (and d!45758 res!119298) b!142896))

(assert (= (and b!142896 res!119299) b!142897))

(assert (= (and b!142897 (not res!119300)) b!142898))

(assert (=> b!142896 m!219133))

(assert (=> b!142896 m!219131))

(assert (=> b!142898 m!219133))

(assert (=> b!142898 m!219133))

(declare-fun m!219379 () Bool)

(assert (=> b!142898 m!219379))

(assert (=> b!142732 d!45758))

(declare-fun d!45760 () Bool)

(assert (=> d!45760 (= (array_inv!2745 (buf!3383 thiss!1634)) (bvsge (size!2956 (buf!3383 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!142743 d!45760))

(declare-fun d!45762 () Bool)

(declare-fun lt!221526 () tuple2!12702)

(assert (=> d!45762 (= lt!221526 (readByte!0 lt!221285))))

(assert (=> d!45762 (= (readBytePure!0 lt!221285) (tuple2!12681 (_2!6691 lt!221526) (_1!6691 lt!221526)))))

(declare-fun bs!11230 () Bool)

(assert (= bs!11230 d!45762))

(declare-fun m!219381 () Bool)

(assert (=> bs!11230 m!219381))

(assert (=> b!142733 d!45762))

(declare-fun d!45764 () Bool)

(declare-fun e!95182 () Bool)

(assert (=> d!45764 e!95182))

(declare-fun res!119301 () Bool)

(assert (=> d!45764 (=> (not res!119301) (not e!95182))))

(declare-fun lt!221528 () (_ BitVec 64))

(declare-fun lt!221527 () (_ BitVec 64))

(declare-fun lt!221531 () (_ BitVec 64))

(assert (=> d!45764 (= res!119301 (= lt!221527 (bvsub lt!221531 lt!221528)))))

(assert (=> d!45764 (or (= (bvand lt!221531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221528 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221531 lt!221528) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45764 (= lt!221528 (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_1!6679 lt!221276)))) ((_ sign_extend 32) (currentByte!6261 (_1!6679 lt!221276))) ((_ sign_extend 32) (currentBit!6256 (_1!6679 lt!221276)))))))

(declare-fun lt!221529 () (_ BitVec 64))

(declare-fun lt!221532 () (_ BitVec 64))

(assert (=> d!45764 (= lt!221531 (bvmul lt!221529 lt!221532))))

(assert (=> d!45764 (or (= lt!221529 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221532 (bvsdiv (bvmul lt!221529 lt!221532) lt!221529)))))

(assert (=> d!45764 (= lt!221532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45764 (= lt!221529 ((_ sign_extend 32) (size!2956 (buf!3383 (_1!6679 lt!221276)))))))

(assert (=> d!45764 (= lt!221527 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6261 (_1!6679 lt!221276))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6256 (_1!6679 lt!221276)))))))

(assert (=> d!45764 (invariant!0 (currentBit!6256 (_1!6679 lt!221276)) (currentByte!6261 (_1!6679 lt!221276)) (size!2956 (buf!3383 (_1!6679 lt!221276))))))

(assert (=> d!45764 (= (bitIndex!0 (size!2956 (buf!3383 (_1!6679 lt!221276))) (currentByte!6261 (_1!6679 lt!221276)) (currentBit!6256 (_1!6679 lt!221276))) lt!221527)))

(declare-fun b!142899 () Bool)

(declare-fun res!119302 () Bool)

(assert (=> b!142899 (=> (not res!119302) (not e!95182))))

(assert (=> b!142899 (= res!119302 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221527))))

(declare-fun b!142900 () Bool)

(declare-fun lt!221530 () (_ BitVec 64))

(assert (=> b!142900 (= e!95182 (bvsle lt!221527 (bvmul lt!221530 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142900 (or (= lt!221530 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221530 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221530)))))

(assert (=> b!142900 (= lt!221530 ((_ sign_extend 32) (size!2956 (buf!3383 (_1!6679 lt!221276)))))))

(assert (= (and d!45764 res!119301) b!142899))

(assert (= (and b!142899 res!119302) b!142900))

(declare-fun m!219383 () Bool)

(assert (=> d!45764 m!219383))

(declare-fun m!219385 () Bool)

(assert (=> d!45764 m!219385))

(assert (=> b!142733 d!45764))

(declare-fun d!45766 () Bool)

(declare-fun e!95185 () Bool)

(assert (=> d!45766 e!95185))

(declare-fun res!119305 () Bool)

(assert (=> d!45766 (=> (not res!119305) (not e!95185))))

(declare-fun lt!221564 () tuple2!12680)

(declare-fun lt!221563 () tuple2!12680)

(assert (=> d!45766 (= res!119305 (= (bitIndex!0 (size!2956 (buf!3383 (_1!6679 lt!221564))) (currentByte!6261 (_1!6679 lt!221564)) (currentBit!6256 (_1!6679 lt!221564))) (bitIndex!0 (size!2956 (buf!3383 (_1!6679 lt!221563))) (currentByte!6261 (_1!6679 lt!221563)) (currentBit!6256 (_1!6679 lt!221563)))))))

(declare-fun lt!221565 () BitStream!5170)

(declare-fun lt!221566 () Unit!8906)

(declare-fun choose!14 (BitStream!5170 BitStream!5170 BitStream!5170 tuple2!12680 tuple2!12680 BitStream!5170 (_ BitVec 8) tuple2!12680 tuple2!12680 BitStream!5170 (_ BitVec 8)) Unit!8906)

(assert (=> d!45766 (= lt!221566 (choose!14 lt!221285 (_2!6677 lt!221281) lt!221565 lt!221564 (tuple2!12681 (_1!6679 lt!221564) (_2!6679 lt!221564)) (_1!6679 lt!221564) (_2!6679 lt!221564) lt!221563 (tuple2!12681 (_1!6679 lt!221563) (_2!6679 lt!221563)) (_1!6679 lt!221563) (_2!6679 lt!221563)))))

(assert (=> d!45766 (= lt!221563 (readBytePure!0 lt!221565))))

(assert (=> d!45766 (= lt!221564 (readBytePure!0 lt!221285))))

(assert (=> d!45766 (= lt!221565 (BitStream!5171 (buf!3383 (_2!6677 lt!221281)) (currentByte!6261 lt!221285) (currentBit!6256 lt!221285)))))

(assert (=> d!45766 (= (readBytePrefixLemma!0 lt!221285 (_2!6677 lt!221281)) lt!221566)))

(declare-fun b!142905 () Bool)

(assert (=> b!142905 (= e!95185 (= (_2!6679 lt!221564) (_2!6679 lt!221563)))))

(assert (= (and d!45766 res!119305) b!142905))

(declare-fun m!219387 () Bool)

(assert (=> d!45766 m!219387))

(declare-fun m!219389 () Bool)

(assert (=> d!45766 m!219389))

(assert (=> d!45766 m!219117))

(declare-fun m!219391 () Bool)

(assert (=> d!45766 m!219391))

(declare-fun m!219393 () Bool)

(assert (=> d!45766 m!219393))

(assert (=> b!142733 d!45766))

(declare-fun b!142951 () Bool)

(declare-fun res!119345 () Bool)

(declare-fun e!95211 () Bool)

(assert (=> b!142951 (=> (not res!119345) (not e!95211))))

(declare-fun lt!221697 () (_ BitVec 64))

(declare-fun lt!221690 () (_ BitVec 64))

(declare-fun lt!221689 () tuple2!12676)

(assert (=> b!142951 (= res!119345 (= (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221689))) (currentByte!6261 (_2!6677 lt!221689)) (currentBit!6256 (_2!6677 lt!221689))) (bvadd lt!221697 lt!221690)))))

(assert (=> b!142951 (or (not (= (bvand lt!221697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221690 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!221697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!221697 lt!221690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!221691 () (_ BitVec 64))

(assert (=> b!142951 (= lt!221690 (bvmul lt!221691 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!142951 (or (= lt!221691 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221691 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221691)))))

(assert (=> b!142951 (= lt!221691 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142951 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142951 (= lt!221697 (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221286))) (currentByte!6261 (_2!6677 lt!221286)) (currentBit!6256 (_2!6677 lt!221286))))))

(declare-fun lt!221695 () tuple2!12682)

(declare-fun e!95210 () Bool)

(declare-fun b!142952 () Bool)

(assert (=> b!142952 (= e!95210 (arrayRangesEq!272 arr!237 (_2!6680 lt!221695) #b00000000000000000000000000000000 to!404))))

(declare-fun b!142953 () Bool)

(assert (=> b!142953 (= e!95211 e!95210)))

(declare-fun res!119349 () Bool)

(assert (=> b!142953 (=> (not res!119349) (not e!95210))))

(declare-fun lt!221694 () tuple2!12678)

(assert (=> b!142953 (= res!119349 (and (= (size!2956 (_2!6680 lt!221695)) (size!2956 arr!237)) (= (_1!6680 lt!221695) (_2!6678 lt!221694))))))

(assert (=> b!142953 (= lt!221695 (readByteArrayLoopPure!0 (_1!6678 lt!221694) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!221696 () Unit!8906)

(declare-fun lt!221693 () Unit!8906)

(assert (=> b!142953 (= lt!221696 lt!221693)))

(declare-fun lt!221692 () (_ BitVec 64))

(assert (=> b!142953 (validate_offset_bits!1 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221689)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) lt!221692)))

(assert (=> b!142953 (= lt!221693 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6677 lt!221286) (buf!3383 (_2!6677 lt!221689)) lt!221692))))

(declare-fun e!95212 () Bool)

(assert (=> b!142953 e!95212))

(declare-fun res!119346 () Bool)

(assert (=> b!142953 (=> (not res!119346) (not e!95212))))

(assert (=> b!142953 (= res!119346 (and (= (size!2956 (buf!3383 (_2!6677 lt!221286))) (size!2956 (buf!3383 (_2!6677 lt!221689)))) (bvsge lt!221692 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142953 (= lt!221692 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!142953 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!142953 (= lt!221694 (reader!0 (_2!6677 lt!221286) (_2!6677 lt!221689)))))

(declare-fun b!142955 () Bool)

(declare-fun res!119347 () Bool)

(assert (=> b!142955 (=> (not res!119347) (not e!95211))))

(assert (=> b!142955 (= res!119347 (isPrefixOf!0 (_2!6677 lt!221286) (_2!6677 lt!221689)))))

(declare-fun b!142954 () Bool)

(assert (=> b!142954 (= e!95212 (validate_offset_bits!1 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) lt!221692))))

(declare-fun d!45768 () Bool)

(assert (=> d!45768 e!95211))

(declare-fun res!119348 () Bool)

(assert (=> d!45768 (=> (not res!119348) (not e!95211))))

(assert (=> d!45768 (= res!119348 (= (size!2956 (buf!3383 (_2!6677 lt!221286))) (size!2956 (buf!3383 (_2!6677 lt!221689)))))))

(declare-fun choose!64 (BitStream!5170 array!6531 (_ BitVec 32) (_ BitVec 32)) tuple2!12676)

(assert (=> d!45768 (= lt!221689 (choose!64 (_2!6677 lt!221286) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45768 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2956 arr!237)))))

(assert (=> d!45768 (= (appendByteArrayLoop!0 (_2!6677 lt!221286) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!221689)))

(assert (= (and d!45768 res!119348) b!142951))

(assert (= (and b!142951 res!119345) b!142955))

(assert (= (and b!142955 res!119347) b!142953))

(assert (= (and b!142953 res!119346) b!142954))

(assert (= (and b!142953 res!119349) b!142952))

(declare-fun m!219485 () Bool)

(assert (=> b!142952 m!219485))

(declare-fun m!219487 () Bool)

(assert (=> b!142955 m!219487))

(declare-fun m!219489 () Bool)

(assert (=> b!142954 m!219489))

(declare-fun m!219491 () Bool)

(assert (=> b!142951 m!219491))

(assert (=> b!142951 m!219131))

(declare-fun m!219493 () Bool)

(assert (=> b!142953 m!219493))

(declare-fun m!219495 () Bool)

(assert (=> b!142953 m!219495))

(declare-fun m!219497 () Bool)

(assert (=> b!142953 m!219497))

(declare-fun m!219499 () Bool)

(assert (=> b!142953 m!219499))

(declare-fun m!219501 () Bool)

(assert (=> d!45768 m!219501))

(assert (=> b!142733 d!45768))

(assert (=> b!142733 d!45736))

(declare-fun d!45789 () Bool)

(declare-fun lt!221698 () tuple2!12702)

(assert (=> d!45789 (= lt!221698 (readByte!0 (_1!6678 lt!221273)))))

(assert (=> d!45789 (= (readBytePure!0 (_1!6678 lt!221273)) (tuple2!12681 (_2!6691 lt!221698) (_1!6691 lt!221698)))))

(declare-fun bs!11234 () Bool)

(assert (= bs!11234 d!45789))

(declare-fun m!219503 () Bool)

(assert (=> bs!11234 m!219503))

(assert (=> b!142733 d!45789))

(declare-fun d!45791 () Bool)

(assert (=> d!45791 (isPrefixOf!0 thiss!1634 (_2!6677 lt!221281))))

(declare-fun lt!221701 () Unit!8906)

(declare-fun choose!30 (BitStream!5170 BitStream!5170 BitStream!5170) Unit!8906)

(assert (=> d!45791 (= lt!221701 (choose!30 thiss!1634 (_2!6677 lt!221286) (_2!6677 lt!221281)))))

(assert (=> d!45791 (isPrefixOf!0 thiss!1634 (_2!6677 lt!221286))))

(assert (=> d!45791 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6677 lt!221286) (_2!6677 lt!221281)) lt!221701)))

(declare-fun bs!11235 () Bool)

(assert (= bs!11235 d!45791))

(assert (=> bs!11235 m!219101))

(declare-fun m!219505 () Bool)

(assert (=> bs!11235 m!219505))

(assert (=> bs!11235 m!219127))

(assert (=> b!142733 d!45791))

(declare-fun b!142956 () Bool)

(declare-fun res!119352 () Bool)

(declare-fun e!95214 () Bool)

(assert (=> b!142956 (=> (not res!119352) (not e!95214))))

(declare-fun lt!221709 () tuple2!12678)

(assert (=> b!142956 (= res!119352 (isPrefixOf!0 (_1!6678 lt!221709) thiss!1634))))

(declare-fun d!45793 () Bool)

(assert (=> d!45793 e!95214))

(declare-fun res!119350 () Bool)

(assert (=> d!45793 (=> (not res!119350) (not e!95214))))

(assert (=> d!45793 (= res!119350 (isPrefixOf!0 (_1!6678 lt!221709) (_2!6678 lt!221709)))))

(declare-fun lt!221702 () BitStream!5170)

(assert (=> d!45793 (= lt!221709 (tuple2!12679 lt!221702 (_2!6677 lt!221281)))))

(declare-fun lt!221717 () Unit!8906)

(declare-fun lt!221710 () Unit!8906)

(assert (=> d!45793 (= lt!221717 lt!221710)))

(assert (=> d!45793 (isPrefixOf!0 lt!221702 (_2!6677 lt!221281))))

(assert (=> d!45793 (= lt!221710 (lemmaIsPrefixTransitive!0 lt!221702 (_2!6677 lt!221281) (_2!6677 lt!221281)))))

(declare-fun lt!221703 () Unit!8906)

(declare-fun lt!221714 () Unit!8906)

(assert (=> d!45793 (= lt!221703 lt!221714)))

(assert (=> d!45793 (isPrefixOf!0 lt!221702 (_2!6677 lt!221281))))

(assert (=> d!45793 (= lt!221714 (lemmaIsPrefixTransitive!0 lt!221702 thiss!1634 (_2!6677 lt!221281)))))

(declare-fun lt!221715 () Unit!8906)

(declare-fun e!95213 () Unit!8906)

(assert (=> d!45793 (= lt!221715 e!95213)))

(declare-fun c!7841 () Bool)

(assert (=> d!45793 (= c!7841 (not (= (size!2956 (buf!3383 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!221712 () Unit!8906)

(declare-fun lt!221708 () Unit!8906)

(assert (=> d!45793 (= lt!221712 lt!221708)))

(assert (=> d!45793 (isPrefixOf!0 (_2!6677 lt!221281) (_2!6677 lt!221281))))

(assert (=> d!45793 (= lt!221708 (lemmaIsPrefixRefl!0 (_2!6677 lt!221281)))))

(declare-fun lt!221711 () Unit!8906)

(declare-fun lt!221716 () Unit!8906)

(assert (=> d!45793 (= lt!221711 lt!221716)))

(assert (=> d!45793 (= lt!221716 (lemmaIsPrefixRefl!0 (_2!6677 lt!221281)))))

(declare-fun lt!221720 () Unit!8906)

(declare-fun lt!221721 () Unit!8906)

(assert (=> d!45793 (= lt!221720 lt!221721)))

(assert (=> d!45793 (isPrefixOf!0 lt!221702 lt!221702)))

(assert (=> d!45793 (= lt!221721 (lemmaIsPrefixRefl!0 lt!221702))))

(declare-fun lt!221719 () Unit!8906)

(declare-fun lt!221706 () Unit!8906)

(assert (=> d!45793 (= lt!221719 lt!221706)))

(assert (=> d!45793 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45793 (= lt!221706 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45793 (= lt!221702 (BitStream!5171 (buf!3383 (_2!6677 lt!221281)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(assert (=> d!45793 (isPrefixOf!0 thiss!1634 (_2!6677 lt!221281))))

(assert (=> d!45793 (= (reader!0 thiss!1634 (_2!6677 lt!221281)) lt!221709)))

(declare-fun b!142957 () Bool)

(declare-fun Unit!8916 () Unit!8906)

(assert (=> b!142957 (= e!95213 Unit!8916)))

(declare-fun b!142958 () Bool)

(declare-fun lt!221713 () Unit!8906)

(assert (=> b!142958 (= e!95213 lt!221713)))

(declare-fun lt!221705 () (_ BitVec 64))

(assert (=> b!142958 (= lt!221705 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!221718 () (_ BitVec 64))

(assert (=> b!142958 (= lt!221718 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(assert (=> b!142958 (= lt!221713 (arrayBitRangesEqSymmetric!0 (buf!3383 thiss!1634) (buf!3383 (_2!6677 lt!221281)) lt!221705 lt!221718))))

(assert (=> b!142958 (arrayBitRangesEq!0 (buf!3383 (_2!6677 lt!221281)) (buf!3383 thiss!1634) lt!221705 lt!221718)))

(declare-fun lt!221707 () (_ BitVec 64))

(declare-fun lt!221704 () (_ BitVec 64))

(declare-fun b!142959 () Bool)

(assert (=> b!142959 (= e!95214 (= (_1!6678 lt!221709) (withMovedBitIndex!0 (_2!6678 lt!221709) (bvsub lt!221707 lt!221704))))))

(assert (=> b!142959 (or (= (bvand lt!221707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221707 lt!221704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142959 (= lt!221704 (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221281))) (currentByte!6261 (_2!6677 lt!221281)) (currentBit!6256 (_2!6677 lt!221281))))))

(assert (=> b!142959 (= lt!221707 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(declare-fun b!142960 () Bool)

(declare-fun res!119351 () Bool)

(assert (=> b!142960 (=> (not res!119351) (not e!95214))))

(assert (=> b!142960 (= res!119351 (isPrefixOf!0 (_2!6678 lt!221709) (_2!6677 lt!221281)))))

(assert (= (and d!45793 c!7841) b!142958))

(assert (= (and d!45793 (not c!7841)) b!142957))

(assert (= (and d!45793 res!119350) b!142956))

(assert (= (and b!142956 res!119352) b!142960))

(assert (= (and b!142960 res!119351) b!142959))

(assert (=> b!142958 m!219133))

(declare-fun m!219507 () Bool)

(assert (=> b!142958 m!219507))

(declare-fun m!219509 () Bool)

(assert (=> b!142958 m!219509))

(declare-fun m!219511 () Bool)

(assert (=> b!142959 m!219511))

(assert (=> b!142959 m!219149))

(assert (=> b!142959 m!219133))

(declare-fun m!219513 () Bool)

(assert (=> b!142960 m!219513))

(declare-fun m!219515 () Bool)

(assert (=> b!142956 m!219515))

(assert (=> d!45793 m!219319))

(declare-fun m!219517 () Bool)

(assert (=> d!45793 m!219517))

(declare-fun m!219519 () Bool)

(assert (=> d!45793 m!219519))

(assert (=> d!45793 m!219355))

(declare-fun m!219521 () Bool)

(assert (=> d!45793 m!219521))

(declare-fun m!219523 () Bool)

(assert (=> d!45793 m!219523))

(assert (=> d!45793 m!219101))

(declare-fun m!219525 () Bool)

(assert (=> d!45793 m!219525))

(assert (=> d!45793 m!219363))

(declare-fun m!219527 () Bool)

(assert (=> d!45793 m!219527))

(assert (=> d!45793 m!219337))

(assert (=> b!142733 d!45793))

(declare-fun d!45795 () Bool)

(declare-fun res!119353 () Bool)

(declare-fun e!95215 () Bool)

(assert (=> d!45795 (=> (not res!119353) (not e!95215))))

(assert (=> d!45795 (= res!119353 (= (size!2956 (buf!3383 thiss!1634)) (size!2956 (buf!3383 (_2!6677 lt!221281)))))))

(assert (=> d!45795 (= (isPrefixOf!0 thiss!1634 (_2!6677 lt!221281)) e!95215)))

(declare-fun b!142961 () Bool)

(declare-fun res!119354 () Bool)

(assert (=> b!142961 (=> (not res!119354) (not e!95215))))

(assert (=> b!142961 (= res!119354 (bvsle (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)) (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221281))) (currentByte!6261 (_2!6677 lt!221281)) (currentBit!6256 (_2!6677 lt!221281)))))))

(declare-fun b!142962 () Bool)

(declare-fun e!95216 () Bool)

(assert (=> b!142962 (= e!95215 e!95216)))

(declare-fun res!119355 () Bool)

(assert (=> b!142962 (=> res!119355 e!95216)))

(assert (=> b!142962 (= res!119355 (= (size!2956 (buf!3383 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!142963 () Bool)

(assert (=> b!142963 (= e!95216 (arrayBitRangesEq!0 (buf!3383 thiss!1634) (buf!3383 (_2!6677 lt!221281)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634))))))

(assert (= (and d!45795 res!119353) b!142961))

(assert (= (and b!142961 res!119354) b!142962))

(assert (= (and b!142962 (not res!119355)) b!142963))

(assert (=> b!142961 m!219133))

(assert (=> b!142961 m!219149))

(assert (=> b!142963 m!219133))

(assert (=> b!142963 m!219133))

(declare-fun m!219529 () Bool)

(assert (=> b!142963 m!219529))

(assert (=> b!142733 d!45795))

(declare-fun d!45797 () Bool)

(declare-fun e!95219 () Bool)

(assert (=> d!45797 e!95219))

(declare-fun res!119362 () Bool)

(assert (=> d!45797 (=> (not res!119362) (not e!95219))))

(declare-fun lt!221733 () tuple2!12676)

(assert (=> d!45797 (= res!119362 (= (size!2956 (buf!3383 thiss!1634)) (size!2956 (buf!3383 (_2!6677 lt!221733)))))))

(declare-fun choose!6 (BitStream!5170 (_ BitVec 8)) tuple2!12676)

(assert (=> d!45797 (= lt!221733 (choose!6 thiss!1634 (select (arr!3675 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45797 (validate_offset_byte!0 ((_ sign_extend 32) (size!2956 (buf!3383 thiss!1634))) ((_ sign_extend 32) (currentByte!6261 thiss!1634)) ((_ sign_extend 32) (currentBit!6256 thiss!1634)))))

(assert (=> d!45797 (= (appendByte!0 thiss!1634 (select (arr!3675 arr!237) from!447)) lt!221733)))

(declare-fun b!142970 () Bool)

(declare-fun res!119364 () Bool)

(assert (=> b!142970 (=> (not res!119364) (not e!95219))))

(declare-fun lt!221735 () (_ BitVec 64))

(declare-fun lt!221732 () (_ BitVec 64))

(assert (=> b!142970 (= res!119364 (= (bitIndex!0 (size!2956 (buf!3383 (_2!6677 lt!221733))) (currentByte!6261 (_2!6677 lt!221733)) (currentBit!6256 (_2!6677 lt!221733))) (bvadd lt!221732 lt!221735)))))

(assert (=> b!142970 (or (not (= (bvand lt!221732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221735 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!221732 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!221732 lt!221735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!142970 (= lt!221735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!142970 (= lt!221732 (bitIndex!0 (size!2956 (buf!3383 thiss!1634)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634)))))

(declare-fun b!142971 () Bool)

(declare-fun res!119363 () Bool)

(assert (=> b!142971 (=> (not res!119363) (not e!95219))))

(assert (=> b!142971 (= res!119363 (isPrefixOf!0 thiss!1634 (_2!6677 lt!221733)))))

(declare-fun lt!221734 () tuple2!12680)

(declare-fun b!142972 () Bool)

(declare-fun lt!221736 () tuple2!12678)

(assert (=> b!142972 (= e!95219 (and (= (_2!6679 lt!221734) (select (arr!3675 arr!237) from!447)) (= (_1!6679 lt!221734) (_2!6678 lt!221736))))))

(assert (=> b!142972 (= lt!221734 (readBytePure!0 (_1!6678 lt!221736)))))

(assert (=> b!142972 (= lt!221736 (reader!0 thiss!1634 (_2!6677 lt!221733)))))

(assert (= (and d!45797 res!119362) b!142970))

(assert (= (and b!142970 res!119364) b!142971))

(assert (= (and b!142971 res!119363) b!142972))

(assert (=> d!45797 m!219109))

(declare-fun m!219531 () Bool)

(assert (=> d!45797 m!219531))

(declare-fun m!219533 () Bool)

(assert (=> d!45797 m!219533))

(declare-fun m!219535 () Bool)

(assert (=> b!142970 m!219535))

(assert (=> b!142970 m!219133))

(declare-fun m!219537 () Bool)

(assert (=> b!142971 m!219537))

(declare-fun m!219539 () Bool)

(assert (=> b!142972 m!219539))

(declare-fun m!219541 () Bool)

(assert (=> b!142972 m!219541))

(assert (=> b!142733 d!45797))

(declare-fun d!45799 () Bool)

(declare-fun e!95224 () Bool)

(assert (=> d!45799 e!95224))

(declare-fun res!119371 () Bool)

(assert (=> d!45799 (=> (not res!119371) (not e!95224))))

(assert (=> d!45799 (= res!119371 (and (or (let ((rhs!3197 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3197 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3197) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45800 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45800 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45800 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3196 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3196 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3196) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!221753 () Unit!8906)

(declare-fun choose!57 (BitStream!5170 BitStream!5170 (_ BitVec 64) (_ BitVec 32)) Unit!8906)

(assert (=> d!45799 (= lt!221753 (choose!57 thiss!1634 (_2!6677 lt!221286) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45799 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6677 lt!221286) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!221753)))

(declare-fun b!142977 () Bool)

(declare-fun lt!221752 () (_ BitVec 32))

(assert (=> b!142977 (= e!95224 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) (bvsub (bvsub to!404 from!447) lt!221752)))))

(assert (=> b!142977 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!221752 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!221752) #b10000000000000000000000000000000)))))

(declare-fun lt!221751 () (_ BitVec 64))

(assert (=> b!142977 (= lt!221752 ((_ extract 31 0) lt!221751))))

(assert (=> b!142977 (and (bvslt lt!221751 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!221751 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!142977 (= lt!221751 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45799 res!119371) b!142977))

(declare-fun m!219543 () Bool)

(assert (=> d!45799 m!219543))

(declare-fun m!219545 () Bool)

(assert (=> b!142977 m!219545))

(assert (=> b!142733 d!45799))

(declare-fun d!45802 () Bool)

(declare-fun lt!221762 () tuple2!12702)

(assert (=> d!45802 (= lt!221762 (readByte!0 (BitStream!5171 (buf!3383 (_2!6677 lt!221281)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634))))))

(assert (=> d!45802 (= (readBytePure!0 (BitStream!5171 (buf!3383 (_2!6677 lt!221281)) (currentByte!6261 thiss!1634) (currentBit!6256 thiss!1634))) (tuple2!12681 (_2!6691 lt!221762) (_1!6691 lt!221762)))))

(declare-fun bs!11236 () Bool)

(assert (= bs!11236 d!45802))

(declare-fun m!219547 () Bool)

(assert (=> bs!11236 m!219547))

(assert (=> b!142733 d!45802))

(declare-fun d!45804 () Bool)

(declare-fun e!95229 () Bool)

(assert (=> d!45804 e!95229))

(declare-fun res!119378 () Bool)

(assert (=> d!45804 (=> (not res!119378) (not e!95229))))

(declare-fun lt!221769 () (_ BitVec 64))

(declare-fun lt!221766 () (_ BitVec 64))

(declare-fun lt!221765 () (_ BitVec 64))

(assert (=> d!45804 (= res!119378 (= lt!221765 (bvsub lt!221769 lt!221766)))))

(assert (=> d!45804 (or (= (bvand lt!221769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!221766 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!221769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!221769 lt!221766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45804 (= lt!221766 (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_1!6679 lt!221277)))) ((_ sign_extend 32) (currentByte!6261 (_1!6679 lt!221277))) ((_ sign_extend 32) (currentBit!6256 (_1!6679 lt!221277)))))))

(declare-fun lt!221767 () (_ BitVec 64))

(declare-fun lt!221770 () (_ BitVec 64))

(assert (=> d!45804 (= lt!221769 (bvmul lt!221767 lt!221770))))

(assert (=> d!45804 (or (= lt!221767 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!221770 (bvsdiv (bvmul lt!221767 lt!221770) lt!221767)))))

(assert (=> d!45804 (= lt!221770 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45804 (= lt!221767 ((_ sign_extend 32) (size!2956 (buf!3383 (_1!6679 lt!221277)))))))

(assert (=> d!45804 (= lt!221765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6261 (_1!6679 lt!221277))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6256 (_1!6679 lt!221277)))))))

(assert (=> d!45804 (invariant!0 (currentBit!6256 (_1!6679 lt!221277)) (currentByte!6261 (_1!6679 lt!221277)) (size!2956 (buf!3383 (_1!6679 lt!221277))))))

(assert (=> d!45804 (= (bitIndex!0 (size!2956 (buf!3383 (_1!6679 lt!221277))) (currentByte!6261 (_1!6679 lt!221277)) (currentBit!6256 (_1!6679 lt!221277))) lt!221765)))

(declare-fun b!142986 () Bool)

(declare-fun res!119379 () Bool)

(assert (=> b!142986 (=> (not res!119379) (not e!95229))))

(assert (=> b!142986 (= res!119379 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!221765))))

(declare-fun b!142987 () Bool)

(declare-fun lt!221768 () (_ BitVec 64))

(assert (=> b!142987 (= e!95229 (bvsle lt!221765 (bvmul lt!221768 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!142987 (or (= lt!221768 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!221768 #b0000000000000000000000000000000000000000000000000000000000001000) lt!221768)))))

(assert (=> b!142987 (= lt!221768 ((_ sign_extend 32) (size!2956 (buf!3383 (_1!6679 lt!221277)))))))

(assert (= (and d!45804 res!119378) b!142986))

(assert (= (and b!142986 res!119379) b!142987))

(declare-fun m!219549 () Bool)

(assert (=> d!45804 m!219549))

(declare-fun m!219551 () Bool)

(assert (=> d!45804 m!219551))

(assert (=> b!142733 d!45804))

(declare-fun d!45806 () Bool)

(assert (=> d!45806 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2956 (buf!3383 (_2!6677 lt!221286)))) ((_ sign_extend 32) (currentByte!6261 (_2!6677 lt!221286))) ((_ sign_extend 32) (currentBit!6256 (_2!6677 lt!221286)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11237 () Bool)

(assert (= bs!11237 d!45806))

(assert (=> bs!11237 m!219287))

(assert (=> b!142733 d!45806))

(push 1)

(assert (not b!142952))

(assert (not d!45793))

(assert (not b!142977))

(assert (not b!142955))

(assert (not b!142898))

(assert (not d!45768))

(assert (not b!142953))

(assert (not d!45804))

(assert (not d!45789))

(assert (not b!142873))

(assert (not b!142876))

(assert (not b!142874))

(assert (not d!45791))

(assert (not d!45797))

(assert (not b!142958))

(assert (not d!45806))

(assert (not d!45766))

(assert (not d!45726))

(assert (not b!142891))

(assert (not d!45748))

(assert (not b!142956))

(assert (not b!142960))

(assert (not b!142896))

(assert (not b!142971))

(assert (not b!142963))

(assert (not b!142877))

(assert (not d!45732))

(assert (not d!45744))

(assert (not b!142872))

(assert (not b!142970))

(assert (not d!45734))

(assert (not d!45802))

(assert (not d!45762))

(assert (not b!142893))

(assert (not b!142951))

(assert (not b!142959))

(assert (not d!45728))

(assert (not d!45714))

(assert (not d!45746))

(assert (not b!142878))

(assert (not b!142961))

(assert (not d!45736))

(assert (not b!142884))

(assert (not b!142871))

(assert (not d!45764))

(assert (not d!45756))

(assert (not b!142972))

(assert (not b!142954))

(assert (not d!45722))

(assert (not b!142869))

(assert (not d!45799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

