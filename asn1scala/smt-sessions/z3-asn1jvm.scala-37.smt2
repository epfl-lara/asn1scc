; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!736 () Bool)

(assert start!736)

(declare-fun b!2453 () Bool)

(declare-fun e!1741 () Bool)

(declare-fun e!1740 () Bool)

(assert (=> b!2453 (= e!1741 e!1740)))

(declare-fun res!4166 () Bool)

(assert (=> b!2453 (=> (not res!4166) (not e!1740))))

(declare-datatypes ((array!233 0))(
  ( (array!234 (arr!482 (Array (_ BitVec 32) (_ BitVec 8))) (size!95 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!168 0))(
  ( (BitStream!169 (buf!404 array!233) (currentByte!1359 (_ BitVec 32)) (currentBit!1354 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!144 0))(
  ( (Unit!145) )
))
(declare-datatypes ((tuple2!200 0))(
  ( (tuple2!201 (_1!107 Unit!144) (_2!107 BitStream!168)) )
))
(declare-fun lt!1842 () tuple2!200)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2453 (= res!4166 (invariant!0 (currentBit!1354 (_2!107 lt!1842)) (currentByte!1359 (_2!107 lt!1842)) (size!95 (buf!404 (_2!107 lt!1842)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!233)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!168)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!168 array!233 (_ BitVec 64) (_ BitVec 64)) tuple2!200)

(assert (=> b!2453 (= lt!1842 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2454 () Bool)

(declare-fun res!4167 () Bool)

(assert (=> b!2454 (=> (not res!4167) (not e!1741))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2454 (= res!4167 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 thiss!1486))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) nBits!460))))

(declare-fun b!2455 () Bool)

(declare-fun res!4170 () Bool)

(assert (=> b!2455 (=> (not res!4170) (not e!1740))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2455 (= res!4170 (= (bitIndex!0 (size!95 (buf!404 (_2!107 lt!1842))) (currentByte!1359 (_2!107 lt!1842)) (currentBit!1354 (_2!107 lt!1842))) (bvadd (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)) nBits!460)))))

(declare-fun b!2457 () Bool)

(declare-fun res!4171 () Bool)

(assert (=> b!2457 (=> (not res!4171) (not e!1740))))

(assert (=> b!2457 (= res!4171 (= (size!95 (buf!404 thiss!1486)) (size!95 (buf!404 (_2!107 lt!1842)))))))

(declare-fun b!2458 () Bool)

(declare-fun e!1745 () Bool)

(assert (=> b!2458 (= e!1740 (not e!1745))))

(declare-fun res!4165 () Bool)

(assert (=> b!2458 (=> res!4165 e!1745)))

(assert (=> b!2458 (= res!4165 (bvsgt nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> b!2458 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!1842)))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) nBits!460)))

(declare-fun lt!1844 () Unit!144)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!168 array!233 (_ BitVec 64)) Unit!144)

(assert (=> b!2458 (= lt!1844 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!404 (_2!107 lt!1842)) nBits!460))))

(declare-datatypes ((tuple2!202 0))(
  ( (tuple2!203 (_1!108 BitStream!168) (_2!108 BitStream!168)) )
))
(declare-fun lt!1843 () tuple2!202)

(declare-fun reader!0 (BitStream!168 BitStream!168) tuple2!202)

(assert (=> b!2458 (= lt!1843 (reader!0 thiss!1486 (_2!107 lt!1842)))))

(declare-fun b!2459 () Bool)

(declare-fun res!4168 () Bool)

(assert (=> b!2459 (=> (not res!4168) (not e!1740))))

(declare-fun isPrefixOf!0 (BitStream!168 BitStream!168) Bool)

(assert (=> b!2459 (= res!4168 (isPrefixOf!0 thiss!1486 (_2!107 lt!1842)))))

(declare-fun b!2460 () Bool)

(declare-fun e!1743 () Bool)

(declare-fun array_inv!90 (array!233) Bool)

(assert (=> b!2460 (= e!1743 (array_inv!90 (buf!404 thiss!1486)))))

(declare-fun res!4169 () Bool)

(assert (=> start!736 (=> (not res!4169) (not e!1741))))

(assert (=> start!736 (= res!4169 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!95 srcBuffer!6))))))))

(assert (=> start!736 e!1741))

(assert (=> start!736 true))

(assert (=> start!736 (array_inv!90 srcBuffer!6)))

(declare-fun inv!12 (BitStream!168) Bool)

(assert (=> start!736 (and (inv!12 thiss!1486) e!1743)))

(declare-fun b!2456 () Bool)

(assert (=> b!2456 (= e!1745 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_1!108 lt!1843)))) ((_ sign_extend 32) (currentByte!1359 (_1!108 lt!1843))) ((_ sign_extend 32) (currentBit!1354 (_1!108 lt!1843))) nBits!460))))

(assert (= (and start!736 res!4169) b!2454))

(assert (= (and b!2454 res!4167) b!2453))

(assert (= (and b!2453 res!4166) b!2457))

(assert (= (and b!2457 res!4171) b!2455))

(assert (= (and b!2455 res!4170) b!2459))

(assert (= (and b!2459 res!4168) b!2458))

(assert (= (and b!2458 (not res!4165)) b!2456))

(assert (= start!736 b!2460))

(declare-fun m!2093 () Bool)

(assert (=> b!2456 m!2093))

(declare-fun m!2095 () Bool)

(assert (=> b!2459 m!2095))

(declare-fun m!2097 () Bool)

(assert (=> b!2458 m!2097))

(declare-fun m!2099 () Bool)

(assert (=> b!2458 m!2099))

(declare-fun m!2101 () Bool)

(assert (=> b!2458 m!2101))

(declare-fun m!2103 () Bool)

(assert (=> b!2453 m!2103))

(declare-fun m!2105 () Bool)

(assert (=> b!2453 m!2105))

(declare-fun m!2107 () Bool)

(assert (=> start!736 m!2107))

(declare-fun m!2109 () Bool)

(assert (=> start!736 m!2109))

(declare-fun m!2111 () Bool)

(assert (=> b!2460 m!2111))

(declare-fun m!2113 () Bool)

(assert (=> b!2454 m!2113))

(declare-fun m!2115 () Bool)

(assert (=> b!2455 m!2115))

(declare-fun m!2117 () Bool)

(assert (=> b!2455 m!2117))

(check-sat (not b!2458) (not b!2459) (not b!2460) (not b!2454) (not b!2456) (not b!2455) (not b!2453) (not start!736))
(check-sat)
(get-model)

(declare-fun d!1398 () Bool)

(assert (=> d!1398 (= (array_inv!90 (buf!404 thiss!1486)) (bvsge (size!95 (buf!404 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2460 d!1398))

(declare-fun d!1400 () Bool)

(declare-fun e!1766 () Bool)

(assert (=> d!1400 e!1766))

(declare-fun res!4197 () Bool)

(assert (=> d!1400 (=> (not res!4197) (not e!1766))))

(declare-fun lt!1873 () (_ BitVec 64))

(declare-fun lt!1870 () (_ BitVec 64))

(declare-fun lt!1872 () (_ BitVec 64))

(assert (=> d!1400 (= res!4197 (= lt!1873 (bvsub lt!1870 lt!1872)))))

(assert (=> d!1400 (or (= (bvand lt!1870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1872 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1870 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1870 lt!1872) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1400 (= lt!1872 (remainingBits!0 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!1842)))) ((_ sign_extend 32) (currentByte!1359 (_2!107 lt!1842))) ((_ sign_extend 32) (currentBit!1354 (_2!107 lt!1842)))))))

(declare-fun lt!1874 () (_ BitVec 64))

(declare-fun lt!1871 () (_ BitVec 64))

(assert (=> d!1400 (= lt!1870 (bvmul lt!1874 lt!1871))))

(assert (=> d!1400 (or (= lt!1874 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!1871 (bvsdiv (bvmul lt!1874 lt!1871) lt!1874)))))

(assert (=> d!1400 (= lt!1871 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1400 (= lt!1874 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!1842)))))))

(assert (=> d!1400 (= lt!1873 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1359 (_2!107 lt!1842))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1354 (_2!107 lt!1842)))))))

(assert (=> d!1400 (invariant!0 (currentBit!1354 (_2!107 lt!1842)) (currentByte!1359 (_2!107 lt!1842)) (size!95 (buf!404 (_2!107 lt!1842))))))

(assert (=> d!1400 (= (bitIndex!0 (size!95 (buf!404 (_2!107 lt!1842))) (currentByte!1359 (_2!107 lt!1842)) (currentBit!1354 (_2!107 lt!1842))) lt!1873)))

(declare-fun b!2489 () Bool)

(declare-fun res!4198 () Bool)

(assert (=> b!2489 (=> (not res!4198) (not e!1766))))

(assert (=> b!2489 (= res!4198 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!1873))))

(declare-fun b!2490 () Bool)

(declare-fun lt!1869 () (_ BitVec 64))

(assert (=> b!2490 (= e!1766 (bvsle lt!1873 (bvmul lt!1869 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2490 (or (= lt!1869 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!1869 #b0000000000000000000000000000000000000000000000000000000000001000) lt!1869)))))

(assert (=> b!2490 (= lt!1869 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!1842)))))))

(assert (= (and d!1400 res!4197) b!2489))

(assert (= (and b!2489 res!4198) b!2490))

(declare-fun m!2161 () Bool)

(assert (=> d!1400 m!2161))

(assert (=> d!1400 m!2103))

(assert (=> b!2455 d!1400))

(declare-fun d!1428 () Bool)

(declare-fun e!1767 () Bool)

(assert (=> d!1428 e!1767))

(declare-fun res!4199 () Bool)

(assert (=> d!1428 (=> (not res!4199) (not e!1767))))

(declare-fun lt!1879 () (_ BitVec 64))

(declare-fun lt!1878 () (_ BitVec 64))

(declare-fun lt!1876 () (_ BitVec 64))

(assert (=> d!1428 (= res!4199 (= lt!1879 (bvsub lt!1876 lt!1878)))))

(assert (=> d!1428 (or (= (bvand lt!1876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1878 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1876 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1876 lt!1878) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1428 (= lt!1878 (remainingBits!0 ((_ sign_extend 32) (size!95 (buf!404 thiss!1486))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486))))))

(declare-fun lt!1880 () (_ BitVec 64))

(declare-fun lt!1877 () (_ BitVec 64))

(assert (=> d!1428 (= lt!1876 (bvmul lt!1880 lt!1877))))

(assert (=> d!1428 (or (= lt!1880 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!1877 (bvsdiv (bvmul lt!1880 lt!1877) lt!1880)))))

(assert (=> d!1428 (= lt!1877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1428 (= lt!1880 ((_ sign_extend 32) (size!95 (buf!404 thiss!1486))))))

(assert (=> d!1428 (= lt!1879 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1359 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1354 thiss!1486))))))

(assert (=> d!1428 (invariant!0 (currentBit!1354 thiss!1486) (currentByte!1359 thiss!1486) (size!95 (buf!404 thiss!1486)))))

(assert (=> d!1428 (= (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)) lt!1879)))

(declare-fun b!2491 () Bool)

(declare-fun res!4200 () Bool)

(assert (=> b!2491 (=> (not res!4200) (not e!1767))))

(assert (=> b!2491 (= res!4200 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!1879))))

(declare-fun b!2492 () Bool)

(declare-fun lt!1875 () (_ BitVec 64))

(assert (=> b!2492 (= e!1767 (bvsle lt!1879 (bvmul lt!1875 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2492 (or (= lt!1875 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!1875 #b0000000000000000000000000000000000000000000000000000000000001000) lt!1875)))))

(assert (=> b!2492 (= lt!1875 ((_ sign_extend 32) (size!95 (buf!404 thiss!1486))))))

(assert (= (and d!1428 res!4199) b!2491))

(assert (= (and b!2491 res!4200) b!2492))

(declare-fun m!2163 () Bool)

(assert (=> d!1428 m!2163))

(declare-fun m!2165 () Bool)

(assert (=> d!1428 m!2165))

(assert (=> b!2455 d!1428))

(declare-fun d!1430 () Bool)

(assert (=> d!1430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 thiss!1486))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!95 (buf!404 thiss!1486))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486))) nBits!460))))

(declare-fun bs!550 () Bool)

(assert (= bs!550 d!1430))

(assert (=> bs!550 m!2163))

(assert (=> b!2454 d!1430))

(declare-fun d!1432 () Bool)

(declare-fun res!4209 () Bool)

(declare-fun e!1772 () Bool)

(assert (=> d!1432 (=> (not res!4209) (not e!1772))))

(assert (=> d!1432 (= res!4209 (= (size!95 (buf!404 thiss!1486)) (size!95 (buf!404 (_2!107 lt!1842)))))))

(assert (=> d!1432 (= (isPrefixOf!0 thiss!1486 (_2!107 lt!1842)) e!1772)))

(declare-fun b!2499 () Bool)

(declare-fun res!4208 () Bool)

(assert (=> b!2499 (=> (not res!4208) (not e!1772))))

(assert (=> b!2499 (= res!4208 (bvsle (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)) (bitIndex!0 (size!95 (buf!404 (_2!107 lt!1842))) (currentByte!1359 (_2!107 lt!1842)) (currentBit!1354 (_2!107 lt!1842)))))))

(declare-fun b!2500 () Bool)

(declare-fun e!1773 () Bool)

(assert (=> b!2500 (= e!1772 e!1773)))

(declare-fun res!4207 () Bool)

(assert (=> b!2500 (=> res!4207 e!1773)))

(assert (=> b!2500 (= res!4207 (= (size!95 (buf!404 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!2501 () Bool)

(declare-fun arrayBitRangesEq!0 (array!233 array!233 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2501 (= e!1773 (arrayBitRangesEq!0 (buf!404 thiss!1486) (buf!404 (_2!107 lt!1842)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486))))))

(assert (= (and d!1432 res!4209) b!2499))

(assert (= (and b!2499 res!4208) b!2500))

(assert (= (and b!2500 (not res!4207)) b!2501))

(assert (=> b!2499 m!2117))

(assert (=> b!2499 m!2115))

(assert (=> b!2501 m!2117))

(assert (=> b!2501 m!2117))

(declare-fun m!2167 () Bool)

(assert (=> b!2501 m!2167))

(assert (=> b!2459 d!1432))

(declare-fun d!1434 () Bool)

(assert (=> d!1434 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!1842)))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!1842)))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486))) nBits!460))))

(declare-fun bs!551 () Bool)

(assert (= bs!551 d!1434))

(declare-fun m!2169 () Bool)

(assert (=> bs!551 m!2169))

(assert (=> b!2458 d!1434))

(declare-fun d!1436 () Bool)

(assert (=> d!1436 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!1842)))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) nBits!460)))

(declare-fun lt!1883 () Unit!144)

(declare-fun choose!9 (BitStream!168 array!233 (_ BitVec 64) BitStream!168) Unit!144)

(assert (=> d!1436 (= lt!1883 (choose!9 thiss!1486 (buf!404 (_2!107 lt!1842)) nBits!460 (BitStream!169 (buf!404 (_2!107 lt!1842)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486))))))

(assert (=> d!1436 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!404 (_2!107 lt!1842)) nBits!460) lt!1883)))

(declare-fun bs!552 () Bool)

(assert (= bs!552 d!1436))

(assert (=> bs!552 m!2097))

(declare-fun m!2171 () Bool)

(assert (=> bs!552 m!2171))

(assert (=> b!2458 d!1436))

(declare-fun d!1438 () Bool)

(declare-fun e!1791 () Bool)

(assert (=> d!1438 e!1791))

(declare-fun res!4235 () Bool)

(assert (=> d!1438 (=> (not res!4235) (not e!1791))))

(declare-fun lt!2003 () tuple2!202)

(assert (=> d!1438 (= res!4235 (isPrefixOf!0 (_1!108 lt!2003) (_2!108 lt!2003)))))

(declare-fun lt!1996 () BitStream!168)

(assert (=> d!1438 (= lt!2003 (tuple2!203 lt!1996 (_2!107 lt!1842)))))

(declare-fun lt!1999 () Unit!144)

(declare-fun lt!2002 () Unit!144)

(assert (=> d!1438 (= lt!1999 lt!2002)))

(assert (=> d!1438 (isPrefixOf!0 lt!1996 (_2!107 lt!1842))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!168 BitStream!168 BitStream!168) Unit!144)

(assert (=> d!1438 (= lt!2002 (lemmaIsPrefixTransitive!0 lt!1996 (_2!107 lt!1842) (_2!107 lt!1842)))))

(declare-fun lt!1993 () Unit!144)

(declare-fun lt!1987 () Unit!144)

(assert (=> d!1438 (= lt!1993 lt!1987)))

(assert (=> d!1438 (isPrefixOf!0 lt!1996 (_2!107 lt!1842))))

(assert (=> d!1438 (= lt!1987 (lemmaIsPrefixTransitive!0 lt!1996 thiss!1486 (_2!107 lt!1842)))))

(declare-fun lt!1992 () Unit!144)

(declare-fun e!1790 () Unit!144)

(assert (=> d!1438 (= lt!1992 e!1790)))

(declare-fun c!104 () Bool)

(assert (=> d!1438 (= c!104 (not (= (size!95 (buf!404 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!2000 () Unit!144)

(declare-fun lt!1988 () Unit!144)

(assert (=> d!1438 (= lt!2000 lt!1988)))

(assert (=> d!1438 (isPrefixOf!0 (_2!107 lt!1842) (_2!107 lt!1842))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!168) Unit!144)

(assert (=> d!1438 (= lt!1988 (lemmaIsPrefixRefl!0 (_2!107 lt!1842)))))

(declare-fun lt!1985 () Unit!144)

(declare-fun lt!1995 () Unit!144)

(assert (=> d!1438 (= lt!1985 lt!1995)))

(assert (=> d!1438 (= lt!1995 (lemmaIsPrefixRefl!0 (_2!107 lt!1842)))))

(declare-fun lt!1991 () Unit!144)

(declare-fun lt!1997 () Unit!144)

(assert (=> d!1438 (= lt!1991 lt!1997)))

(assert (=> d!1438 (isPrefixOf!0 lt!1996 lt!1996)))

(assert (=> d!1438 (= lt!1997 (lemmaIsPrefixRefl!0 lt!1996))))

(declare-fun lt!1998 () Unit!144)

(declare-fun lt!1986 () Unit!144)

(assert (=> d!1438 (= lt!1998 lt!1986)))

(assert (=> d!1438 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1438 (= lt!1986 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1438 (= lt!1996 (BitStream!169 (buf!404 (_2!107 lt!1842)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)))))

(assert (=> d!1438 (isPrefixOf!0 thiss!1486 (_2!107 lt!1842))))

(assert (=> d!1438 (= (reader!0 thiss!1486 (_2!107 lt!1842)) lt!2003)))

(declare-fun b!2536 () Bool)

(declare-fun Unit!150 () Unit!144)

(assert (=> b!2536 (= e!1790 Unit!150)))

(declare-fun b!2537 () Bool)

(declare-fun lt!1989 () (_ BitVec 64))

(declare-fun lt!1994 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!168 (_ BitVec 64)) BitStream!168)

(assert (=> b!2537 (= e!1791 (= (_1!108 lt!2003) (withMovedBitIndex!0 (_2!108 lt!2003) (bvsub lt!1989 lt!1994))))))

(assert (=> b!2537 (or (= (bvand lt!1989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1994 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1989 lt!1994) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2537 (= lt!1994 (bitIndex!0 (size!95 (buf!404 (_2!107 lt!1842))) (currentByte!1359 (_2!107 lt!1842)) (currentBit!1354 (_2!107 lt!1842))))))

(assert (=> b!2537 (= lt!1989 (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)))))

(declare-fun b!2538 () Bool)

(declare-fun res!4236 () Bool)

(assert (=> b!2538 (=> (not res!4236) (not e!1791))))

(assert (=> b!2538 (= res!4236 (isPrefixOf!0 (_1!108 lt!2003) thiss!1486))))

(declare-fun b!2539 () Bool)

(declare-fun lt!1984 () Unit!144)

(assert (=> b!2539 (= e!1790 lt!1984)))

(declare-fun lt!1990 () (_ BitVec 64))

(assert (=> b!2539 (= lt!1990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2001 () (_ BitVec 64))

(assert (=> b!2539 (= lt!2001 (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!233 array!233 (_ BitVec 64) (_ BitVec 64)) Unit!144)

(assert (=> b!2539 (= lt!1984 (arrayBitRangesEqSymmetric!0 (buf!404 thiss!1486) (buf!404 (_2!107 lt!1842)) lt!1990 lt!2001))))

(assert (=> b!2539 (arrayBitRangesEq!0 (buf!404 (_2!107 lt!1842)) (buf!404 thiss!1486) lt!1990 lt!2001)))

(declare-fun b!2540 () Bool)

(declare-fun res!4234 () Bool)

(assert (=> b!2540 (=> (not res!4234) (not e!1791))))

(assert (=> b!2540 (= res!4234 (isPrefixOf!0 (_2!108 lt!2003) (_2!107 lt!1842)))))

(assert (= (and d!1438 c!104) b!2539))

(assert (= (and d!1438 (not c!104)) b!2536))

(assert (= (and d!1438 res!4235) b!2538))

(assert (= (and b!2538 res!4236) b!2540))

(assert (= (and b!2540 res!4234) b!2537))

(declare-fun m!2205 () Bool)

(assert (=> b!2540 m!2205))

(declare-fun m!2207 () Bool)

(assert (=> b!2537 m!2207))

(assert (=> b!2537 m!2115))

(assert (=> b!2537 m!2117))

(assert (=> d!1438 m!2095))

(declare-fun m!2209 () Bool)

(assert (=> d!1438 m!2209))

(declare-fun m!2211 () Bool)

(assert (=> d!1438 m!2211))

(declare-fun m!2213 () Bool)

(assert (=> d!1438 m!2213))

(declare-fun m!2215 () Bool)

(assert (=> d!1438 m!2215))

(declare-fun m!2217 () Bool)

(assert (=> d!1438 m!2217))

(declare-fun m!2219 () Bool)

(assert (=> d!1438 m!2219))

(declare-fun m!2221 () Bool)

(assert (=> d!1438 m!2221))

(declare-fun m!2223 () Bool)

(assert (=> d!1438 m!2223))

(declare-fun m!2225 () Bool)

(assert (=> d!1438 m!2225))

(declare-fun m!2227 () Bool)

(assert (=> d!1438 m!2227))

(declare-fun m!2229 () Bool)

(assert (=> b!2538 m!2229))

(assert (=> b!2539 m!2117))

(declare-fun m!2231 () Bool)

(assert (=> b!2539 m!2231))

(declare-fun m!2233 () Bool)

(assert (=> b!2539 m!2233))

(assert (=> b!2458 d!1438))

(declare-fun d!1446 () Bool)

(assert (=> d!1446 (= (invariant!0 (currentBit!1354 (_2!107 lt!1842)) (currentByte!1359 (_2!107 lt!1842)) (size!95 (buf!404 (_2!107 lt!1842)))) (and (bvsge (currentBit!1354 (_2!107 lt!1842)) #b00000000000000000000000000000000) (bvslt (currentBit!1354 (_2!107 lt!1842)) #b00000000000000000000000000001000) (bvsge (currentByte!1359 (_2!107 lt!1842)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1359 (_2!107 lt!1842)) (size!95 (buf!404 (_2!107 lt!1842)))) (and (= (currentBit!1354 (_2!107 lt!1842)) #b00000000000000000000000000000000) (= (currentByte!1359 (_2!107 lt!1842)) (size!95 (buf!404 (_2!107 lt!1842))))))))))

(assert (=> b!2453 d!1446))

(declare-fun b!2620 () Bool)

(declare-fun res!4299 () Bool)

(declare-fun e!1824 () Bool)

(assert (=> b!2620 (=> (not res!4299) (not e!1824))))

(declare-fun lt!2461 () tuple2!200)

(assert (=> b!2620 (= res!4299 (= (size!95 (buf!404 (_2!107 lt!2461))) (size!95 (buf!404 thiss!1486))))))

(declare-fun b!2621 () Bool)

(declare-fun lt!2460 () tuple2!202)

(declare-datatypes ((List!10 0))(
  ( (Nil!7) (Cons!6 (h!125 Bool) (t!760 List!10)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!168 BitStream!168 (_ BitVec 64)) List!10)

(declare-fun byteArrayBitContentToList!0 (BitStream!168 array!233 (_ BitVec 64) (_ BitVec 64)) List!10)

(assert (=> b!2621 (= e!1824 (= (bitStreamReadBitsIntoList!0 (_2!107 lt!2461) (_1!108 lt!2460) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!107 lt!2461) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!2621 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2621 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!2443 () Unit!144)

(declare-fun lt!2454 () Unit!144)

(assert (=> b!2621 (= lt!2443 lt!2454)))

(declare-fun lt!2426 () (_ BitVec 64))

(assert (=> b!2621 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!2461)))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) lt!2426)))

(assert (=> b!2621 (= lt!2454 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!404 (_2!107 lt!2461)) lt!2426))))

(declare-fun e!1822 () Bool)

(assert (=> b!2621 e!1822))

(declare-fun res!4296 () Bool)

(assert (=> b!2621 (=> (not res!4296) (not e!1822))))

(assert (=> b!2621 (= res!4296 (and (= (size!95 (buf!404 thiss!1486)) (size!95 (buf!404 (_2!107 lt!2461)))) (bvsge lt!2426 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2621 (= lt!2426 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!2621 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2621 (= lt!2460 (reader!0 thiss!1486 (_2!107 lt!2461)))))

(declare-fun b!2622 () Bool)

(assert (=> b!2622 (= e!1822 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 thiss!1486))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) lt!2426))))

(declare-fun b!2623 () Bool)

(declare-fun res!4294 () Bool)

(assert (=> b!2623 (=> (not res!4294) (not e!1824))))

(assert (=> b!2623 (= res!4294 (= (size!95 (buf!404 thiss!1486)) (size!95 (buf!404 (_2!107 lt!2461)))))))

(declare-fun b!2624 () Bool)

(declare-fun res!4298 () Bool)

(assert (=> b!2624 (=> (not res!4298) (not e!1824))))

(assert (=> b!2624 (= res!4298 (isPrefixOf!0 thiss!1486 (_2!107 lt!2461)))))

(declare-fun d!1448 () Bool)

(assert (=> d!1448 e!1824))

(declare-fun res!4295 () Bool)

(assert (=> d!1448 (=> (not res!4295) (not e!1824))))

(declare-fun lt!2432 () (_ BitVec 64))

(assert (=> d!1448 (= res!4295 (= (bitIndex!0 (size!95 (buf!404 (_2!107 lt!2461))) (currentByte!1359 (_2!107 lt!2461)) (currentBit!1354 (_2!107 lt!2461))) (bvsub lt!2432 from!367)))))

(assert (=> d!1448 (or (= (bvand lt!2432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2432 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2432 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!2427 () (_ BitVec 64))

(assert (=> d!1448 (= lt!2432 (bvadd lt!2427 from!367 nBits!460))))

(assert (=> d!1448 (or (not (= (bvand lt!2427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!2427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!2427 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1448 (= lt!2427 (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)))))

(declare-fun e!1823 () tuple2!200)

(assert (=> d!1448 (= lt!2461 e!1823)))

(declare-fun c!116 () Bool)

(assert (=> d!1448 (= c!116 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!2462 () Unit!144)

(declare-fun lt!2424 () Unit!144)

(assert (=> d!1448 (= lt!2462 lt!2424)))

(assert (=> d!1448 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1448 (= lt!2424 (lemmaIsPrefixRefl!0 thiss!1486))))

(declare-fun lt!2435 () (_ BitVec 64))

(assert (=> d!1448 (= lt!2435 (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)))))

(assert (=> d!1448 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1448 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!2461)))

(declare-fun b!2625 () Bool)

(declare-fun res!4297 () Bool)

(assert (=> b!2625 (=> (not res!4297) (not e!1824))))

(assert (=> b!2625 (= res!4297 (invariant!0 (currentBit!1354 (_2!107 lt!2461)) (currentByte!1359 (_2!107 lt!2461)) (size!95 (buf!404 (_2!107 lt!2461)))))))

(declare-fun b!2626 () Bool)

(declare-fun lt!2425 () tuple2!200)

(declare-fun Unit!158 () Unit!144)

(assert (=> b!2626 (= e!1823 (tuple2!201 Unit!158 (_2!107 lt!2425)))))

(declare-fun lt!2436 () tuple2!200)

(declare-fun appendBitFromByte!0 (BitStream!168 (_ BitVec 8) (_ BitVec 32)) tuple2!200)

(assert (=> b!2626 (= lt!2436 (appendBitFromByte!0 thiss!1486 (select (arr!482 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!2452 () (_ BitVec 64))

(assert (=> b!2626 (= lt!2452 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2420 () (_ BitVec 64))

(assert (=> b!2626 (= lt!2420 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2438 () Unit!144)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!168 BitStream!168 (_ BitVec 64) (_ BitVec 64)) Unit!144)

(assert (=> b!2626 (= lt!2438 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!107 lt!2436) lt!2452 lt!2420))))

(assert (=> b!2626 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!2436)))) ((_ sign_extend 32) (currentByte!1359 (_2!107 lt!2436))) ((_ sign_extend 32) (currentBit!1354 (_2!107 lt!2436))) (bvsub lt!2452 lt!2420))))

(declare-fun lt!2441 () Unit!144)

(assert (=> b!2626 (= lt!2441 lt!2438)))

(declare-fun lt!2453 () tuple2!202)

(assert (=> b!2626 (= lt!2453 (reader!0 thiss!1486 (_2!107 lt!2436)))))

(declare-fun lt!2458 () (_ BitVec 64))

(assert (=> b!2626 (= lt!2458 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2423 () Unit!144)

(assert (=> b!2626 (= lt!2423 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!404 (_2!107 lt!2436)) lt!2458))))

(assert (=> b!2626 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!2436)))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) lt!2458)))

(declare-fun lt!2451 () Unit!144)

(assert (=> b!2626 (= lt!2451 lt!2423)))

(declare-fun head!10 (List!10) Bool)

(assert (=> b!2626 (= (head!10 (byteArrayBitContentToList!0 (_2!107 lt!2436) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!10 (bitStreamReadBitsIntoList!0 (_2!107 lt!2436) (_1!108 lt!2453) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2430 () Unit!144)

(declare-fun Unit!159 () Unit!144)

(assert (=> b!2626 (= lt!2430 Unit!159)))

(assert (=> b!2626 (= lt!2425 (appendBitsMSBFirstLoop!0 (_2!107 lt!2436) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!2457 () Unit!144)

(assert (=> b!2626 (= lt!2457 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!107 lt!2436) (_2!107 lt!2425)))))

(assert (=> b!2626 (isPrefixOf!0 thiss!1486 (_2!107 lt!2425))))

(declare-fun lt!2448 () Unit!144)

(assert (=> b!2626 (= lt!2448 lt!2457)))

(assert (=> b!2626 (= (size!95 (buf!404 (_2!107 lt!2425))) (size!95 (buf!404 thiss!1486)))))

(declare-fun lt!2455 () Unit!144)

(declare-fun Unit!161 () Unit!144)

(assert (=> b!2626 (= lt!2455 Unit!161)))

(assert (=> b!2626 (= (bitIndex!0 (size!95 (buf!404 (_2!107 lt!2425))) (currentByte!1359 (_2!107 lt!2425)) (currentBit!1354 (_2!107 lt!2425))) (bvsub (bvadd (bitIndex!0 (size!95 (buf!404 thiss!1486)) (currentByte!1359 thiss!1486) (currentBit!1354 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!2422 () Unit!144)

(declare-fun Unit!162 () Unit!144)

(assert (=> b!2626 (= lt!2422 Unit!162)))

(assert (=> b!2626 (= (bitIndex!0 (size!95 (buf!404 (_2!107 lt!2425))) (currentByte!1359 (_2!107 lt!2425)) (currentBit!1354 (_2!107 lt!2425))) (bvsub (bvsub (bvadd (bitIndex!0 (size!95 (buf!404 (_2!107 lt!2436))) (currentByte!1359 (_2!107 lt!2436)) (currentBit!1354 (_2!107 lt!2436))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!2449 () Unit!144)

(declare-fun Unit!164 () Unit!144)

(assert (=> b!2626 (= lt!2449 Unit!164)))

(declare-fun lt!2442 () tuple2!202)

(declare-fun call!20 () tuple2!202)

(assert (=> b!2626 (= lt!2442 call!20)))

(declare-fun lt!2419 () (_ BitVec 64))

(assert (=> b!2626 (= lt!2419 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2456 () Unit!144)

(assert (=> b!2626 (= lt!2456 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!404 (_2!107 lt!2425)) lt!2419))))

(assert (=> b!2626 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!2425)))) ((_ sign_extend 32) (currentByte!1359 thiss!1486)) ((_ sign_extend 32) (currentBit!1354 thiss!1486)) lt!2419)))

(declare-fun lt!2439 () Unit!144)

(assert (=> b!2626 (= lt!2439 lt!2456)))

(declare-fun lt!2434 () tuple2!202)

(assert (=> b!2626 (= lt!2434 (reader!0 (_2!107 lt!2436) (_2!107 lt!2425)))))

(declare-fun lt!2450 () (_ BitVec 64))

(assert (=> b!2626 (= lt!2450 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!2433 () Unit!144)

(assert (=> b!2626 (= lt!2433 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!107 lt!2436) (buf!404 (_2!107 lt!2425)) lt!2450))))

(assert (=> b!2626 (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_2!107 lt!2425)))) ((_ sign_extend 32) (currentByte!1359 (_2!107 lt!2436))) ((_ sign_extend 32) (currentBit!1354 (_2!107 lt!2436))) lt!2450)))

(declare-fun lt!2447 () Unit!144)

(assert (=> b!2626 (= lt!2447 lt!2433)))

(declare-fun lt!2429 () List!10)

(assert (=> b!2626 (= lt!2429 (byteArrayBitContentToList!0 (_2!107 lt!2425) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!2428 () List!10)

(assert (=> b!2626 (= lt!2428 (byteArrayBitContentToList!0 (_2!107 lt!2425) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2446 () List!10)

(assert (=> b!2626 (= lt!2446 (bitStreamReadBitsIntoList!0 (_2!107 lt!2425) (_1!108 lt!2442) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!2445 () List!10)

(assert (=> b!2626 (= lt!2445 (bitStreamReadBitsIntoList!0 (_2!107 lt!2425) (_1!108 lt!2434) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2437 () (_ BitVec 64))

(assert (=> b!2626 (= lt!2437 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2421 () Unit!144)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!168 BitStream!168 BitStream!168 BitStream!168 (_ BitVec 64) List!10) Unit!144)

(assert (=> b!2626 (= lt!2421 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!107 lt!2425) (_2!107 lt!2425) (_1!108 lt!2442) (_1!108 lt!2434) lt!2437 lt!2446))))

(declare-fun tail!17 (List!10) List!10)

(assert (=> b!2626 (= (bitStreamReadBitsIntoList!0 (_2!107 lt!2425) (_1!108 lt!2434) (bvsub lt!2437 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!17 lt!2446))))

(declare-fun lt!2440 () Unit!144)

(assert (=> b!2626 (= lt!2440 lt!2421)))

(declare-fun lt!2444 () Unit!144)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!233 array!233 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!144)

(assert (=> b!2626 (= lt!2444 (arrayBitRangesEqImpliesEq!0 (buf!404 (_2!107 lt!2436)) (buf!404 (_2!107 lt!2425)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!2435 (bitIndex!0 (size!95 (buf!404 (_2!107 lt!2436))) (currentByte!1359 (_2!107 lt!2436)) (currentBit!1354 (_2!107 lt!2436)))))))

(declare-fun bitAt!0 (array!233 (_ BitVec 64)) Bool)

(assert (=> b!2626 (= (bitAt!0 (buf!404 (_2!107 lt!2436)) lt!2435) (bitAt!0 (buf!404 (_2!107 lt!2425)) lt!2435))))

(declare-fun lt!2431 () Unit!144)

(assert (=> b!2626 (= lt!2431 lt!2444)))

(declare-fun b!2627 () Bool)

(declare-fun Unit!167 () Unit!144)

(assert (=> b!2627 (= e!1823 (tuple2!201 Unit!167 thiss!1486))))

(assert (=> b!2627 (= (size!95 (buf!404 thiss!1486)) (size!95 (buf!404 thiss!1486)))))

(declare-fun lt!2459 () Unit!144)

(declare-fun Unit!168 () Unit!144)

(assert (=> b!2627 (= lt!2459 Unit!168)))

(declare-fun checkByteArrayBitContent!0 (BitStream!168 array!233 array!233 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!210 0))(
  ( (tuple2!211 (_1!112 array!233) (_2!112 BitStream!168)) )
))
(declare-fun readBits!0 (BitStream!168 (_ BitVec 64)) tuple2!210)

(assert (=> b!2627 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!112 (readBits!0 (_1!108 call!20) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun bm!17 () Bool)

(assert (=> bm!17 (= call!20 (reader!0 thiss!1486 (ite c!116 (_2!107 lt!2425) thiss!1486)))))

(assert (= (and d!1448 c!116) b!2626))

(assert (= (and d!1448 (not c!116)) b!2627))

(assert (= (or b!2626 b!2627) bm!17))

(assert (= (and d!1448 res!4295) b!2625))

(assert (= (and b!2625 res!4297) b!2623))

(assert (= (and b!2623 res!4294) b!2624))

(assert (= (and b!2624 res!4298) b!2620))

(assert (= (and b!2620 res!4299) b!2621))

(assert (= (and b!2621 res!4296) b!2622))

(declare-fun m!2365 () Bool)

(assert (=> bm!17 m!2365))

(declare-fun m!2369 () Bool)

(assert (=> b!2622 m!2369))

(declare-fun m!2373 () Bool)

(assert (=> b!2625 m!2373))

(declare-fun m!2377 () Bool)

(assert (=> b!2624 m!2377))

(declare-fun m!2381 () Bool)

(assert (=> b!2627 m!2381))

(declare-fun m!2385 () Bool)

(assert (=> b!2627 m!2385))

(declare-fun m!2389 () Bool)

(assert (=> d!1448 m!2389))

(assert (=> d!1448 m!2117))

(assert (=> d!1448 m!2225))

(assert (=> d!1448 m!2221))

(declare-fun m!2399 () Bool)

(assert (=> b!2621 m!2399))

(declare-fun m!2403 () Bool)

(assert (=> b!2621 m!2403))

(declare-fun m!2407 () Bool)

(assert (=> b!2621 m!2407))

(declare-fun m!2411 () Bool)

(assert (=> b!2621 m!2411))

(declare-fun m!2413 () Bool)

(assert (=> b!2621 m!2413))

(declare-fun m!2417 () Bool)

(assert (=> b!2626 m!2417))

(declare-fun m!2421 () Bool)

(assert (=> b!2626 m!2421))

(declare-fun m!2425 () Bool)

(assert (=> b!2626 m!2425))

(declare-fun m!2429 () Bool)

(assert (=> b!2626 m!2429))

(declare-fun m!2433 () Bool)

(assert (=> b!2626 m!2433))

(declare-fun m!2437 () Bool)

(assert (=> b!2626 m!2437))

(declare-fun m!2441 () Bool)

(assert (=> b!2626 m!2441))

(declare-fun m!2443 () Bool)

(assert (=> b!2626 m!2443))

(declare-fun m!2447 () Bool)

(assert (=> b!2626 m!2447))

(declare-fun m!2451 () Bool)

(assert (=> b!2626 m!2451))

(declare-fun m!2457 () Bool)

(assert (=> b!2626 m!2457))

(declare-fun m!2461 () Bool)

(assert (=> b!2626 m!2461))

(assert (=> b!2626 m!2443))

(declare-fun m!2465 () Bool)

(assert (=> b!2626 m!2465))

(declare-fun m!2469 () Bool)

(assert (=> b!2626 m!2469))

(declare-fun m!2473 () Bool)

(assert (=> b!2626 m!2473))

(declare-fun m!2475 () Bool)

(assert (=> b!2626 m!2475))

(assert (=> b!2626 m!2117))

(declare-fun m!2479 () Bool)

(assert (=> b!2626 m!2479))

(declare-fun m!2483 () Bool)

(assert (=> b!2626 m!2483))

(assert (=> b!2626 m!2437))

(declare-fun m!2487 () Bool)

(assert (=> b!2626 m!2487))

(assert (=> b!2626 m!2447))

(declare-fun m!2493 () Bool)

(assert (=> b!2626 m!2493))

(declare-fun m!2497 () Bool)

(assert (=> b!2626 m!2497))

(declare-fun m!2501 () Bool)

(assert (=> b!2626 m!2501))

(declare-fun m!2505 () Bool)

(assert (=> b!2626 m!2505))

(declare-fun m!2509 () Bool)

(assert (=> b!2626 m!2509))

(declare-fun m!2512 () Bool)

(assert (=> b!2626 m!2512))

(assert (=> b!2626 m!2457))

(declare-fun m!2517 () Bool)

(assert (=> b!2626 m!2517))

(declare-fun m!2519 () Bool)

(assert (=> b!2626 m!2519))

(declare-fun m!2521 () Bool)

(assert (=> b!2626 m!2521))

(declare-fun m!2523 () Bool)

(assert (=> b!2626 m!2523))

(declare-fun m!2525 () Bool)

(assert (=> b!2626 m!2525))

(declare-fun m!2527 () Bool)

(assert (=> b!2626 m!2527))

(assert (=> b!2453 d!1448))

(declare-fun d!1466 () Bool)

(assert (=> d!1466 (= (array_inv!90 srcBuffer!6) (bvsge (size!95 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!736 d!1466))

(declare-fun d!1468 () Bool)

(assert (=> d!1468 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1354 thiss!1486) (currentByte!1359 thiss!1486) (size!95 (buf!404 thiss!1486))))))

(declare-fun bs!555 () Bool)

(assert (= bs!555 d!1468))

(assert (=> bs!555 m!2165))

(assert (=> start!736 d!1468))

(declare-fun d!1470 () Bool)

(assert (=> d!1470 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!95 (buf!404 (_1!108 lt!1843)))) ((_ sign_extend 32) (currentByte!1359 (_1!108 lt!1843))) ((_ sign_extend 32) (currentBit!1354 (_1!108 lt!1843))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!95 (buf!404 (_1!108 lt!1843)))) ((_ sign_extend 32) (currentByte!1359 (_1!108 lt!1843))) ((_ sign_extend 32) (currentBit!1354 (_1!108 lt!1843)))) nBits!460))))

(declare-fun bs!556 () Bool)

(assert (= bs!556 d!1470))

(declare-fun m!2529 () Bool)

(assert (=> bs!556 m!2529))

(assert (=> b!2456 d!1470))

(check-sat (not b!2627) (not b!2537) (not d!1448) (not b!2540) (not b!2626) (not b!2625) (not b!2621) (not d!1434) (not d!1468) (not d!1400) (not b!2501) (not d!1428) (not b!2622) (not bm!17) (not d!1438) (not d!1436) (not b!2624) (not b!2499) (not d!1470) (not b!2538) (not b!2539) (not d!1430))
(check-sat)
