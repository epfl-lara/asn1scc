; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!738 () Bool)

(assert start!738)

(declare-fun b!2477 () Bool)

(declare-fun res!4191 () Bool)

(declare-fun e!1762 () Bool)

(assert (=> b!2477 (=> (not res!4191) (not e!1762))))

(declare-datatypes ((array!235 0))(
  ( (array!236 (arr!483 (Array (_ BitVec 32) (_ BitVec 8))) (size!96 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!170 0))(
  ( (BitStream!171 (buf!405 array!235) (currentByte!1360 (_ BitVec 32)) (currentBit!1355 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!170)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2477 (= res!4191 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 thiss!1486))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) nBits!460))))

(declare-fun b!2479 () Bool)

(declare-fun e!1760 () Bool)

(assert (=> b!2479 (= e!1762 e!1760)))

(declare-fun res!4187 () Bool)

(assert (=> b!2479 (=> (not res!4187) (not e!1760))))

(declare-datatypes ((Unit!146 0))(
  ( (Unit!147) )
))
(declare-datatypes ((tuple2!204 0))(
  ( (tuple2!205 (_1!109 Unit!146) (_2!109 BitStream!170)) )
))
(declare-fun lt!1851 () tuple2!204)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!2479 (= res!4187 (invariant!0 (currentBit!1355 (_2!109 lt!1851)) (currentByte!1360 (_2!109 lt!1851)) (size!96 (buf!405 (_2!109 lt!1851)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!235)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!170 array!235 (_ BitVec 64) (_ BitVec 64)) tuple2!204)

(assert (=> b!2479 (= lt!1851 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!2480 () Bool)

(declare-fun e!1763 () Bool)

(assert (=> b!2480 (= e!1760 (not e!1763))))

(declare-fun res!4190 () Bool)

(assert (=> b!2480 (=> res!4190 e!1763)))

(assert (=> b!2480 (= res!4190 (bvsgt nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> b!2480 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!1851)))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) nBits!460)))

(declare-fun lt!1853 () Unit!146)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!170 array!235 (_ BitVec 64)) Unit!146)

(assert (=> b!2480 (= lt!1853 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!405 (_2!109 lt!1851)) nBits!460))))

(declare-datatypes ((tuple2!206 0))(
  ( (tuple2!207 (_1!110 BitStream!170) (_2!110 BitStream!170)) )
))
(declare-fun lt!1852 () tuple2!206)

(declare-fun reader!0 (BitStream!170 BitStream!170) tuple2!206)

(assert (=> b!2480 (= lt!1852 (reader!0 thiss!1486 (_2!109 lt!1851)))))

(declare-fun b!2481 () Bool)

(declare-fun res!4189 () Bool)

(assert (=> b!2481 (=> (not res!4189) (not e!1760))))

(assert (=> b!2481 (= res!4189 (= (size!96 (buf!405 thiss!1486)) (size!96 (buf!405 (_2!109 lt!1851)))))))

(declare-fun b!2482 () Bool)

(assert (=> b!2482 (= e!1763 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_1!110 lt!1852)))) ((_ sign_extend 32) (currentByte!1360 (_1!110 lt!1852))) ((_ sign_extend 32) (currentBit!1355 (_1!110 lt!1852))) nBits!460))))

(declare-fun b!2483 () Bool)

(declare-fun res!4188 () Bool)

(assert (=> b!2483 (=> (not res!4188) (not e!1760))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!2483 (= res!4188 (= (bitIndex!0 (size!96 (buf!405 (_2!109 lt!1851))) (currentByte!1360 (_2!109 lt!1851)) (currentBit!1355 (_2!109 lt!1851))) (bvadd (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)) nBits!460)))))

(declare-fun b!2484 () Bool)

(declare-fun res!4192 () Bool)

(assert (=> b!2484 (=> (not res!4192) (not e!1760))))

(declare-fun isPrefixOf!0 (BitStream!170 BitStream!170) Bool)

(assert (=> b!2484 (= res!4192 (isPrefixOf!0 thiss!1486 (_2!109 lt!1851)))))

(declare-fun b!2478 () Bool)

(declare-fun e!1758 () Bool)

(declare-fun array_inv!91 (array!235) Bool)

(assert (=> b!2478 (= e!1758 (array_inv!91 (buf!405 thiss!1486)))))

(declare-fun res!4186 () Bool)

(assert (=> start!738 (=> (not res!4186) (not e!1762))))

(assert (=> start!738 (= res!4186 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!96 srcBuffer!6))))))))

(assert (=> start!738 e!1762))

(assert (=> start!738 true))

(assert (=> start!738 (array_inv!91 srcBuffer!6)))

(declare-fun inv!12 (BitStream!170) Bool)

(assert (=> start!738 (and (inv!12 thiss!1486) e!1758)))

(assert (= (and start!738 res!4186) b!2477))

(assert (= (and b!2477 res!4191) b!2479))

(assert (= (and b!2479 res!4187) b!2481))

(assert (= (and b!2481 res!4189) b!2483))

(assert (= (and b!2483 res!4188) b!2484))

(assert (= (and b!2484 res!4192) b!2480))

(assert (= (and b!2480 (not res!4190)) b!2482))

(assert (= start!738 b!2478))

(declare-fun m!2119 () Bool)

(assert (=> b!2477 m!2119))

(declare-fun m!2121 () Bool)

(assert (=> start!738 m!2121))

(declare-fun m!2123 () Bool)

(assert (=> start!738 m!2123))

(declare-fun m!2125 () Bool)

(assert (=> b!2478 m!2125))

(declare-fun m!2127 () Bool)

(assert (=> b!2480 m!2127))

(declare-fun m!2129 () Bool)

(assert (=> b!2480 m!2129))

(declare-fun m!2131 () Bool)

(assert (=> b!2480 m!2131))

(declare-fun m!2133 () Bool)

(assert (=> b!2483 m!2133))

(declare-fun m!2135 () Bool)

(assert (=> b!2483 m!2135))

(declare-fun m!2137 () Bool)

(assert (=> b!2484 m!2137))

(declare-fun m!2139 () Bool)

(assert (=> b!2482 m!2139))

(declare-fun m!2141 () Bool)

(assert (=> b!2479 m!2141))

(declare-fun m!2143 () Bool)

(assert (=> b!2479 m!2143))

(push 1)

(assert (not b!2483))

(assert (not b!2482))

(assert (not b!2478))

(assert (not start!738))

(assert (not b!2480))

(assert (not b!2477))

(assert (not b!2479))

(assert (not b!2484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1404 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1404 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_1!110 lt!1852)))) ((_ sign_extend 32) (currentByte!1360 (_1!110 lt!1852))) ((_ sign_extend 32) (currentBit!1355 (_1!110 lt!1852))) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!96 (buf!405 (_1!110 lt!1852)))) ((_ sign_extend 32) (currentByte!1360 (_1!110 lt!1852))) ((_ sign_extend 32) (currentBit!1355 (_1!110 lt!1852)))) nBits!460))))

(declare-fun bs!543 () Bool)

(assert (= bs!543 d!1404))

(declare-fun m!2147 () Bool)

(assert (=> bs!543 m!2147))

(assert (=> b!2482 d!1404))

(declare-fun d!1410 () Bool)

(assert (=> d!1410 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 thiss!1486))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!96 (buf!405 thiss!1486))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486))) nBits!460))))

(declare-fun bs!544 () Bool)

(assert (= bs!544 d!1410))

(declare-fun m!2149 () Bool)

(assert (=> bs!544 m!2149))

(assert (=> b!2477 d!1410))

(declare-fun d!1412 () Bool)

(assert (=> d!1412 (= (array_inv!91 srcBuffer!6) (bvsge (size!96 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!738 d!1412))

(declare-fun d!1414 () Bool)

(assert (=> d!1414 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1355 thiss!1486) (currentByte!1360 thiss!1486) (size!96 (buf!405 thiss!1486))))))

(declare-fun bs!547 () Bool)

(assert (= bs!547 d!1414))

(declare-fun m!2155 () Bool)

(assert (=> bs!547 m!2155))

(assert (=> start!738 d!1414))

(declare-fun d!1420 () Bool)

(assert (=> d!1420 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!1851)))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!1851)))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486))) nBits!460))))

(declare-fun bs!548 () Bool)

(assert (= bs!548 d!1420))

(declare-fun m!2157 () Bool)

(assert (=> bs!548 m!2157))

(assert (=> b!2480 d!1420))

(declare-fun d!1422 () Bool)

(assert (=> d!1422 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!1851)))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) nBits!460)))

(declare-fun lt!1868 () Unit!146)

(declare-fun choose!9 (BitStream!170 array!235 (_ BitVec 64) BitStream!170) Unit!146)

(assert (=> d!1422 (= lt!1868 (choose!9 thiss!1486 (buf!405 (_2!109 lt!1851)) nBits!460 (BitStream!171 (buf!405 (_2!109 lt!1851)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486))))))

(assert (=> d!1422 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!405 (_2!109 lt!1851)) nBits!460) lt!1868)))

(declare-fun bs!549 () Bool)

(assert (= bs!549 d!1422))

(assert (=> bs!549 m!2127))

(declare-fun m!2159 () Bool)

(assert (=> bs!549 m!2159))

(assert (=> b!2480 d!1422))

(declare-fun b!2512 () Bool)

(declare-fun e!1778 () Unit!146)

(declare-fun lt!1930 () Unit!146)

(assert (=> b!2512 (= e!1778 lt!1930)))

(declare-fun lt!1933 () (_ BitVec 64))

(assert (=> b!2512 (= lt!1933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1935 () (_ BitVec 64))

(assert (=> b!2512 (= lt!1935 (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!235 array!235 (_ BitVec 64) (_ BitVec 64)) Unit!146)

(assert (=> b!2512 (= lt!1930 (arrayBitRangesEqSymmetric!0 (buf!405 thiss!1486) (buf!405 (_2!109 lt!1851)) lt!1933 lt!1935))))

(declare-fun arrayBitRangesEq!0 (array!235 array!235 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!2512 (arrayBitRangesEq!0 (buf!405 (_2!109 lt!1851)) (buf!405 thiss!1486) lt!1933 lt!1935)))

(declare-fun b!2513 () Bool)

(declare-fun Unit!149 () Unit!146)

(assert (=> b!2513 (= e!1778 Unit!149)))

(declare-fun lt!1938 () (_ BitVec 64))

(declare-fun e!1779 () Bool)

(declare-fun b!2514 () Bool)

(declare-fun lt!1924 () (_ BitVec 64))

(declare-fun lt!1934 () tuple2!206)

(declare-fun withMovedBitIndex!0 (BitStream!170 (_ BitVec 64)) BitStream!170)

(assert (=> b!2514 (= e!1779 (= (_1!110 lt!1934) (withMovedBitIndex!0 (_2!110 lt!1934) (bvsub lt!1938 lt!1924))))))

(assert (=> b!2514 (or (= (bvand lt!1938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1924 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1938 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1938 lt!1924) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2514 (= lt!1924 (bitIndex!0 (size!96 (buf!405 (_2!109 lt!1851))) (currentByte!1360 (_2!109 lt!1851)) (currentBit!1355 (_2!109 lt!1851))))))

(assert (=> b!2514 (= lt!1938 (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)))))

(declare-fun b!2515 () Bool)

(declare-fun res!4217 () Bool)

(assert (=> b!2515 (=> (not res!4217) (not e!1779))))

(assert (=> b!2515 (= res!4217 (isPrefixOf!0 (_2!110 lt!1934) (_2!109 lt!1851)))))

(declare-fun b!2516 () Bool)

(declare-fun res!4216 () Bool)

(assert (=> b!2516 (=> (not res!4216) (not e!1779))))

(assert (=> b!2516 (= res!4216 (isPrefixOf!0 (_1!110 lt!1934) thiss!1486))))

(declare-fun d!1426 () Bool)

(assert (=> d!1426 e!1779))

(declare-fun res!4218 () Bool)

(assert (=> d!1426 (=> (not res!4218) (not e!1779))))

(assert (=> d!1426 (= res!4218 (isPrefixOf!0 (_1!110 lt!1934) (_2!110 lt!1934)))))

(declare-fun lt!1928 () BitStream!170)

(assert (=> d!1426 (= lt!1934 (tuple2!207 lt!1928 (_2!109 lt!1851)))))

(declare-fun lt!1940 () Unit!146)

(declare-fun lt!1941 () Unit!146)

(assert (=> d!1426 (= lt!1940 lt!1941)))

(assert (=> d!1426 (isPrefixOf!0 lt!1928 (_2!109 lt!1851))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!170 BitStream!170 BitStream!170) Unit!146)

(assert (=> d!1426 (= lt!1941 (lemmaIsPrefixTransitive!0 lt!1928 (_2!109 lt!1851) (_2!109 lt!1851)))))

(declare-fun lt!1936 () Unit!146)

(declare-fun lt!1939 () Unit!146)

(assert (=> d!1426 (= lt!1936 lt!1939)))

(assert (=> d!1426 (isPrefixOf!0 lt!1928 (_2!109 lt!1851))))

(assert (=> d!1426 (= lt!1939 (lemmaIsPrefixTransitive!0 lt!1928 thiss!1486 (_2!109 lt!1851)))))

(declare-fun lt!1931 () Unit!146)

(assert (=> d!1426 (= lt!1931 e!1778)))

(declare-fun c!101 () Bool)

(assert (=> d!1426 (= c!101 (not (= (size!96 (buf!405 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!1943 () Unit!146)

(declare-fun lt!1926 () Unit!146)

(assert (=> d!1426 (= lt!1943 lt!1926)))

(assert (=> d!1426 (isPrefixOf!0 (_2!109 lt!1851) (_2!109 lt!1851))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!170) Unit!146)

(assert (=> d!1426 (= lt!1926 (lemmaIsPrefixRefl!0 (_2!109 lt!1851)))))

(declare-fun lt!1932 () Unit!146)

(declare-fun lt!1925 () Unit!146)

(assert (=> d!1426 (= lt!1932 lt!1925)))

(assert (=> d!1426 (= lt!1925 (lemmaIsPrefixRefl!0 (_2!109 lt!1851)))))

(declare-fun lt!1942 () Unit!146)

(declare-fun lt!1929 () Unit!146)

(assert (=> d!1426 (= lt!1942 lt!1929)))

(assert (=> d!1426 (isPrefixOf!0 lt!1928 lt!1928)))

(assert (=> d!1426 (= lt!1929 (lemmaIsPrefixRefl!0 lt!1928))))

(declare-fun lt!1927 () Unit!146)

(declare-fun lt!1937 () Unit!146)

(assert (=> d!1426 (= lt!1927 lt!1937)))

(assert (=> d!1426 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1426 (= lt!1937 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1426 (= lt!1928 (BitStream!171 (buf!405 (_2!109 lt!1851)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)))))

(assert (=> d!1426 (isPrefixOf!0 thiss!1486 (_2!109 lt!1851))))

(assert (=> d!1426 (= (reader!0 thiss!1486 (_2!109 lt!1851)) lt!1934)))

(assert (= (and d!1426 c!101) b!2512))

(assert (= (and d!1426 (not c!101)) b!2513))

(assert (= (and d!1426 res!4218) b!2516))

(assert (= (and b!2516 res!4216) b!2515))

(assert (= (and b!2515 res!4217) b!2514))

(declare-fun m!2173 () Bool)

(assert (=> d!1426 m!2173))

(declare-fun m!2175 () Bool)

(assert (=> d!1426 m!2175))

(declare-fun m!2177 () Bool)

(assert (=> d!1426 m!2177))

(declare-fun m!2179 () Bool)

(assert (=> d!1426 m!2179))

(declare-fun m!2181 () Bool)

(assert (=> d!1426 m!2181))

(declare-fun m!2183 () Bool)

(assert (=> d!1426 m!2183))

(declare-fun m!2185 () Bool)

(assert (=> d!1426 m!2185))

(declare-fun m!2187 () Bool)

(assert (=> d!1426 m!2187))

(declare-fun m!2189 () Bool)

(assert (=> d!1426 m!2189))

(declare-fun m!2191 () Bool)

(assert (=> d!1426 m!2191))

(assert (=> d!1426 m!2137))

(declare-fun m!2193 () Bool)

(assert (=> b!2515 m!2193))

(assert (=> b!2512 m!2135))

(declare-fun m!2195 () Bool)

(assert (=> b!2512 m!2195))

(declare-fun m!2197 () Bool)

(assert (=> b!2512 m!2197))

(declare-fun m!2199 () Bool)

(assert (=> b!2514 m!2199))

(assert (=> b!2514 m!2133))

(assert (=> b!2514 m!2135))

(declare-fun m!2201 () Bool)

(assert (=> b!2516 m!2201))

(assert (=> b!2480 d!1426))

(declare-fun d!1440 () Bool)

(declare-fun res!4232 () Bool)

(declare-fun e!1789 () Bool)

(assert (=> d!1440 (=> (not res!4232) (not e!1789))))

(assert (=> d!1440 (= res!4232 (= (size!96 (buf!405 thiss!1486)) (size!96 (buf!405 (_2!109 lt!1851)))))))

(assert (=> d!1440 (= (isPrefixOf!0 thiss!1486 (_2!109 lt!1851)) e!1789)))

(declare-fun b!2533 () Bool)

(declare-fun res!4231 () Bool)

(assert (=> b!2533 (=> (not res!4231) (not e!1789))))

(assert (=> b!2533 (= res!4231 (bvsle (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)) (bitIndex!0 (size!96 (buf!405 (_2!109 lt!1851))) (currentByte!1360 (_2!109 lt!1851)) (currentBit!1355 (_2!109 lt!1851)))))))

(declare-fun b!2534 () Bool)

(declare-fun e!1788 () Bool)

(assert (=> b!2534 (= e!1789 e!1788)))

(declare-fun res!4233 () Bool)

(assert (=> b!2534 (=> res!4233 e!1788)))

(assert (=> b!2534 (= res!4233 (= (size!96 (buf!405 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!2535 () Bool)

(assert (=> b!2535 (= e!1788 (arrayBitRangesEq!0 (buf!405 thiss!1486) (buf!405 (_2!109 lt!1851)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486))))))

(assert (= (and d!1440 res!4232) b!2533))

(assert (= (and b!2533 res!4231) b!2534))

(assert (= (and b!2534 (not res!4233)) b!2535))

(assert (=> b!2533 m!2135))

(assert (=> b!2533 m!2133))

(assert (=> b!2535 m!2135))

(assert (=> b!2535 m!2135))

(declare-fun m!2203 () Bool)

(assert (=> b!2535 m!2203))

(assert (=> b!2484 d!1440))

(declare-fun d!1442 () Bool)

(assert (=> d!1442 (= (invariant!0 (currentBit!1355 (_2!109 lt!1851)) (currentByte!1360 (_2!109 lt!1851)) (size!96 (buf!405 (_2!109 lt!1851)))) (and (bvsge (currentBit!1355 (_2!109 lt!1851)) #b00000000000000000000000000000000) (bvslt (currentBit!1355 (_2!109 lt!1851)) #b00000000000000000000000000001000) (bvsge (currentByte!1360 (_2!109 lt!1851)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1360 (_2!109 lt!1851)) (size!96 (buf!405 (_2!109 lt!1851)))) (and (= (currentBit!1355 (_2!109 lt!1851)) #b00000000000000000000000000000000) (= (currentByte!1360 (_2!109 lt!1851)) (size!96 (buf!405 (_2!109 lt!1851))))))))))

(assert (=> b!2479 d!1442))

(declare-fun b!2612 () Bool)

(declare-fun e!1820 () tuple2!204)

(declare-fun lt!2411 () tuple2!204)

(declare-fun Unit!157 () Unit!146)

(assert (=> b!2612 (= e!1820 (tuple2!205 Unit!157 (_2!109 lt!2411)))))

(declare-fun lt!2395 () tuple2!204)

(declare-fun appendBitFromByte!0 (BitStream!170 (_ BitVec 8) (_ BitVec 32)) tuple2!204)

(assert (=> b!2612 (= lt!2395 (appendBitFromByte!0 thiss!1486 (select (arr!483 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!2410 () (_ BitVec 64))

(assert (=> b!2612 (= lt!2410 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2378 () (_ BitVec 64))

(assert (=> b!2612 (= lt!2378 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2417 () Unit!146)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!170 BitStream!170 (_ BitVec 64) (_ BitVec 64)) Unit!146)

(assert (=> b!2612 (= lt!2417 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!109 lt!2395) lt!2410 lt!2378))))

(assert (=> b!2612 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!2395)))) ((_ sign_extend 32) (currentByte!1360 (_2!109 lt!2395))) ((_ sign_extend 32) (currentBit!1355 (_2!109 lt!2395))) (bvsub lt!2410 lt!2378))))

(declare-fun lt!2397 () Unit!146)

(assert (=> b!2612 (= lt!2397 lt!2417)))

(declare-fun lt!2390 () tuple2!206)

(assert (=> b!2612 (= lt!2390 (reader!0 thiss!1486 (_2!109 lt!2395)))))

(declare-fun lt!2401 () (_ BitVec 64))

(assert (=> b!2612 (= lt!2401 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!2412 () Unit!146)

(assert (=> b!2612 (= lt!2412 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!405 (_2!109 lt!2395)) lt!2401))))

(assert (=> b!2612 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!2395)))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) lt!2401)))

(declare-fun lt!2418 () Unit!146)

(assert (=> b!2612 (= lt!2418 lt!2412)))

(declare-datatypes ((List!11 0))(
  ( (Nil!8) (Cons!7 (h!126 Bool) (t!761 List!11)) )
))
(declare-fun head!9 (List!11) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!170 array!235 (_ BitVec 64) (_ BitVec 64)) List!11)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!170 BitStream!170 (_ BitVec 64)) List!11)

(assert (=> b!2612 (= (head!9 (byteArrayBitContentToList!0 (_2!109 lt!2395) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!9 (bitStreamReadBitsIntoList!0 (_2!109 lt!2395) (_1!110 lt!2390) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2386 () Unit!146)

(declare-fun Unit!160 () Unit!146)

(assert (=> b!2612 (= lt!2386 Unit!160)))

(assert (=> b!2612 (= lt!2411 (appendBitsMSBFirstLoop!0 (_2!109 lt!2395) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!2380 () Unit!146)

(assert (=> b!2612 (= lt!2380 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!109 lt!2395) (_2!109 lt!2411)))))

(assert (=> b!2612 (isPrefixOf!0 thiss!1486 (_2!109 lt!2411))))

(declare-fun lt!2385 () Unit!146)

(assert (=> b!2612 (= lt!2385 lt!2380)))

(assert (=> b!2612 (= (size!96 (buf!405 (_2!109 lt!2411))) (size!96 (buf!405 thiss!1486)))))

(declare-fun lt!2384 () Unit!146)

(declare-fun Unit!163 () Unit!146)

(assert (=> b!2612 (= lt!2384 Unit!163)))

(assert (=> b!2612 (= (bitIndex!0 (size!96 (buf!405 (_2!109 lt!2411))) (currentByte!1360 (_2!109 lt!2411)) (currentBit!1355 (_2!109 lt!2411))) (bvsub (bvadd (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!2416 () Unit!146)

(declare-fun Unit!165 () Unit!146)

(assert (=> b!2612 (= lt!2416 Unit!165)))

(assert (=> b!2612 (= (bitIndex!0 (size!96 (buf!405 (_2!109 lt!2411))) (currentByte!1360 (_2!109 lt!2411)) (currentBit!1355 (_2!109 lt!2411))) (bvsub (bvsub (bvadd (bitIndex!0 (size!96 (buf!405 (_2!109 lt!2395))) (currentByte!1360 (_2!109 lt!2395)) (currentBit!1355 (_2!109 lt!2395))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!2402 () Unit!146)

(declare-fun Unit!166 () Unit!146)

(assert (=> b!2612 (= lt!2402 Unit!166)))

(declare-fun lt!2389 () tuple2!206)

(declare-fun call!19 () tuple2!206)

(assert (=> b!2612 (= lt!2389 call!19)))

(declare-fun lt!2377 () (_ BitVec 64))

(assert (=> b!2612 (= lt!2377 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2391 () Unit!146)

(assert (=> b!2612 (= lt!2391 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!405 (_2!109 lt!2411)) lt!2377))))

(assert (=> b!2612 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!2411)))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) lt!2377)))

(declare-fun lt!2387 () Unit!146)

(assert (=> b!2612 (= lt!2387 lt!2391)))

(declare-fun lt!2415 () tuple2!206)

(assert (=> b!2612 (= lt!2415 (reader!0 (_2!109 lt!2395) (_2!109 lt!2411)))))

(declare-fun lt!2406 () (_ BitVec 64))

(assert (=> b!2612 (= lt!2406 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!2414 () Unit!146)

(assert (=> b!2612 (= lt!2414 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!109 lt!2395) (buf!405 (_2!109 lt!2411)) lt!2406))))

(assert (=> b!2612 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!2411)))) ((_ sign_extend 32) (currentByte!1360 (_2!109 lt!2395))) ((_ sign_extend 32) (currentBit!1355 (_2!109 lt!2395))) lt!2406)))

(declare-fun lt!2381 () Unit!146)

(assert (=> b!2612 (= lt!2381 lt!2414)))

(declare-fun lt!2409 () List!11)

(assert (=> b!2612 (= lt!2409 (byteArrayBitContentToList!0 (_2!109 lt!2411) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!2388 () List!11)

(assert (=> b!2612 (= lt!2388 (byteArrayBitContentToList!0 (_2!109 lt!2411) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2404 () List!11)

(assert (=> b!2612 (= lt!2404 (bitStreamReadBitsIntoList!0 (_2!109 lt!2411) (_1!110 lt!2389) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!2407 () List!11)

(assert (=> b!2612 (= lt!2407 (bitStreamReadBitsIntoList!0 (_2!109 lt!2411) (_1!110 lt!2415) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!2396 () (_ BitVec 64))

(assert (=> b!2612 (= lt!2396 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!2375 () Unit!146)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!170 BitStream!170 BitStream!170 BitStream!170 (_ BitVec 64) List!11) Unit!146)

(assert (=> b!2612 (= lt!2375 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!109 lt!2411) (_2!109 lt!2411) (_1!110 lt!2389) (_1!110 lt!2415) lt!2396 lt!2404))))

(declare-fun tail!18 (List!11) List!11)

(assert (=> b!2612 (= (bitStreamReadBitsIntoList!0 (_2!109 lt!2411) (_1!110 lt!2415) (bvsub lt!2396 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!18 lt!2404))))

(declare-fun lt!2394 () Unit!146)

(assert (=> b!2612 (= lt!2394 lt!2375)))

(declare-fun lt!2403 () Unit!146)

(declare-fun lt!2379 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!235 array!235 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!146)

(assert (=> b!2612 (= lt!2403 (arrayBitRangesEqImpliesEq!0 (buf!405 (_2!109 lt!2395)) (buf!405 (_2!109 lt!2411)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!2379 (bitIndex!0 (size!96 (buf!405 (_2!109 lt!2395))) (currentByte!1360 (_2!109 lt!2395)) (currentBit!1355 (_2!109 lt!2395)))))))

(declare-fun bitAt!0 (array!235 (_ BitVec 64)) Bool)

(assert (=> b!2612 (= (bitAt!0 (buf!405 (_2!109 lt!2395)) lt!2379) (bitAt!0 (buf!405 (_2!109 lt!2411)) lt!2379))))

(declare-fun lt!2408 () Unit!146)

(assert (=> b!2612 (= lt!2408 lt!2403)))

(declare-fun b!2613 () Bool)

(declare-fun res!4292 () Bool)

(declare-fun e!1819 () Bool)

(assert (=> b!2613 (=> (not res!4292) (not e!1819))))

(declare-fun lt!2398 () tuple2!204)

(assert (=> b!2613 (= res!4292 (invariant!0 (currentBit!1355 (_2!109 lt!2398)) (currentByte!1360 (_2!109 lt!2398)) (size!96 (buf!405 (_2!109 lt!2398)))))))

(declare-fun b!2614 () Bool)

(declare-fun res!4293 () Bool)

(assert (=> b!2614 (=> (not res!4293) (not e!1819))))

(assert (=> b!2614 (= res!4293 (= (size!96 (buf!405 thiss!1486)) (size!96 (buf!405 (_2!109 lt!2398)))))))

(declare-fun c!115 () Bool)

(declare-fun bm!16 () Bool)

(assert (=> bm!16 (= call!19 (reader!0 thiss!1486 (ite c!115 (_2!109 lt!2411) thiss!1486)))))

(declare-fun b!2615 () Bool)

(declare-fun res!4291 () Bool)

(assert (=> b!2615 (=> (not res!4291) (not e!1819))))

(assert (=> b!2615 (= res!4291 (= (size!96 (buf!405 (_2!109 lt!2398))) (size!96 (buf!405 thiss!1486))))))

(declare-fun lt!2382 () tuple2!206)

(declare-fun b!2616 () Bool)

(assert (=> b!2616 (= e!1819 (= (bitStreamReadBitsIntoList!0 (_2!109 lt!2398) (_1!110 lt!2382) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!109 lt!2398) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!2616 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2616 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!2405 () Unit!146)

(declare-fun lt!2400 () Unit!146)

(assert (=> b!2616 (= lt!2405 lt!2400)))

(declare-fun lt!2399 () (_ BitVec 64))

(assert (=> b!2616 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!2398)))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) lt!2399)))

(assert (=> b!2616 (= lt!2400 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!405 (_2!109 lt!2398)) lt!2399))))

(declare-fun e!1821 () Bool)

(assert (=> b!2616 e!1821))

(declare-fun res!4288 () Bool)

(assert (=> b!2616 (=> (not res!4288) (not e!1821))))

(assert (=> b!2616 (= res!4288 (and (= (size!96 (buf!405 thiss!1486)) (size!96 (buf!405 (_2!109 lt!2398)))) (bvsge lt!2399 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2616 (= lt!2399 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!2616 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!2616 (= lt!2382 (reader!0 thiss!1486 (_2!109 lt!2398)))))

(declare-fun d!1444 () Bool)

(assert (=> d!1444 e!1819))

(declare-fun res!4290 () Bool)

(assert (=> d!1444 (=> (not res!4290) (not e!1819))))

(declare-fun lt!2383 () (_ BitVec 64))

(assert (=> d!1444 (= res!4290 (= (bitIndex!0 (size!96 (buf!405 (_2!109 lt!2398))) (currentByte!1360 (_2!109 lt!2398)) (currentBit!1355 (_2!109 lt!2398))) (bvsub lt!2383 from!367)))))

(assert (=> d!1444 (or (= (bvand lt!2383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2383 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2383 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!2392 () (_ BitVec 64))

(assert (=> d!1444 (= lt!2383 (bvadd lt!2392 from!367 nBits!460))))

(assert (=> d!1444 (or (not (= (bvand lt!2392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!2392 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!2392 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1444 (= lt!2392 (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)))))

(assert (=> d!1444 (= lt!2398 e!1820)))

(assert (=> d!1444 (= c!115 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!2413 () Unit!146)

(declare-fun lt!2376 () Unit!146)

(assert (=> d!1444 (= lt!2413 lt!2376)))

(assert (=> d!1444 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!1444 (= lt!2376 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!1444 (= lt!2379 (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)))))

(assert (=> d!1444 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!1444 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!2398)))

(declare-fun b!2617 () Bool)

(declare-fun Unit!170 () Unit!146)

(assert (=> b!2617 (= e!1820 (tuple2!205 Unit!170 thiss!1486))))

(assert (=> b!2617 (= (size!96 (buf!405 thiss!1486)) (size!96 (buf!405 thiss!1486)))))

(declare-fun lt!2393 () Unit!146)

(declare-fun Unit!171 () Unit!146)

(assert (=> b!2617 (= lt!2393 Unit!171)))

(declare-fun checkByteArrayBitContent!0 (BitStream!170 array!235 array!235 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!212 0))(
  ( (tuple2!213 (_1!113 array!235) (_2!113 BitStream!170)) )
))
(declare-fun readBits!0 (BitStream!170 (_ BitVec 64)) tuple2!212)

(assert (=> b!2617 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!113 (readBits!0 (_1!110 call!19) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun b!2618 () Bool)

(declare-fun res!4289 () Bool)

(assert (=> b!2618 (=> (not res!4289) (not e!1819))))

(assert (=> b!2618 (= res!4289 (isPrefixOf!0 thiss!1486 (_2!109 lt!2398)))))

(declare-fun b!2619 () Bool)

(assert (=> b!2619 (= e!1821 (validate_offset_bits!1 ((_ sign_extend 32) (size!96 (buf!405 thiss!1486))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486)) lt!2399))))

(assert (= (and d!1444 c!115) b!2612))

(assert (= (and d!1444 (not c!115)) b!2617))

(assert (= (or b!2612 b!2617) bm!16))

(assert (= (and d!1444 res!4290) b!2613))

(assert (= (and b!2613 res!4292) b!2614))

(assert (= (and b!2614 res!4293) b!2618))

(assert (= (and b!2618 res!4289) b!2615))

(assert (= (and b!2615 res!4291) b!2616))

(assert (= (and b!2616 res!4288) b!2619))

(declare-fun m!2355 () Bool)

(assert (=> b!2613 m!2355))

(declare-fun m!2357 () Bool)

(assert (=> b!2617 m!2357))

(declare-fun m!2359 () Bool)

(assert (=> b!2617 m!2359))

(declare-fun m!2361 () Bool)

(assert (=> d!1444 m!2361))

(assert (=> d!1444 m!2135))

(assert (=> d!1444 m!2191))

(assert (=> d!1444 m!2181))

(declare-fun m!2367 () Bool)

(assert (=> b!2612 m!2367))

(declare-fun m!2371 () Bool)

(assert (=> b!2612 m!2371))

(declare-fun m!2375 () Bool)

(assert (=> b!2612 m!2375))

(declare-fun m!2379 () Bool)

(assert (=> b!2612 m!2379))

(declare-fun m!2383 () Bool)

(assert (=> b!2612 m!2383))

(declare-fun m!2387 () Bool)

(assert (=> b!2612 m!2387))

(declare-fun m!2391 () Bool)

(assert (=> b!2612 m!2391))

(declare-fun m!2393 () Bool)

(assert (=> b!2612 m!2393))

(declare-fun m!2395 () Bool)

(assert (=> b!2612 m!2395))

(declare-fun m!2397 () Bool)

(assert (=> b!2612 m!2397))

(declare-fun m!2401 () Bool)

(assert (=> b!2612 m!2401))

(declare-fun m!2405 () Bool)

(assert (=> b!2612 m!2405))

(declare-fun m!2409 () Bool)

(assert (=> b!2612 m!2409))

(assert (=> b!2612 m!2135))

(declare-fun m!2415 () Bool)

(assert (=> b!2612 m!2415))

(declare-fun m!2419 () Bool)

(assert (=> b!2612 m!2419))

(assert (=> b!2612 m!2379))

(declare-fun m!2423 () Bool)

(assert (=> b!2612 m!2423))

(declare-fun m!2427 () Bool)

(assert (=> b!2612 m!2427))

(declare-fun m!2431 () Bool)

(assert (=> b!2612 m!2431))

(declare-fun m!2435 () Bool)

(assert (=> b!2612 m!2435))

(assert (=> b!2612 m!2391))

(declare-fun m!2439 () Bool)

(assert (=> b!2612 m!2439))

(declare-fun m!2445 () Bool)

(assert (=> b!2612 m!2445))

(assert (=> b!2612 m!2431))

(declare-fun m!2449 () Bool)

(assert (=> b!2612 m!2449))

(declare-fun m!2453 () Bool)

(assert (=> b!2612 m!2453))

(declare-fun m!2455 () Bool)

(assert (=> b!2612 m!2455))

(declare-fun m!2459 () Bool)

(assert (=> b!2612 m!2459))

(declare-fun m!2463 () Bool)

(assert (=> b!2612 m!2463))

(declare-fun m!2467 () Bool)

(assert (=> b!2612 m!2467))

(declare-fun m!2471 () Bool)

(assert (=> b!2612 m!2471))

(declare-fun m!2477 () Bool)

(assert (=> b!2612 m!2477))

(assert (=> b!2612 m!2397))

(declare-fun m!2481 () Bool)

(assert (=> b!2612 m!2481))

(declare-fun m!2485 () Bool)

(assert (=> b!2612 m!2485))

(declare-fun m!2489 () Bool)

(assert (=> b!2618 m!2489))

(declare-fun m!2491 () Bool)

(assert (=> b!2619 m!2491))

(declare-fun m!2495 () Bool)

(assert (=> bm!16 m!2495))

(declare-fun m!2499 () Bool)

(assert (=> b!2616 m!2499))

(declare-fun m!2503 () Bool)

(assert (=> b!2616 m!2503))

(declare-fun m!2507 () Bool)

(assert (=> b!2616 m!2507))

(declare-fun m!2513 () Bool)

(assert (=> b!2616 m!2513))

(declare-fun m!2515 () Bool)

(assert (=> b!2616 m!2515))

(assert (=> b!2479 d!1444))

(declare-fun d!1462 () Bool)

(assert (=> d!1462 (= (array_inv!91 (buf!405 thiss!1486)) (bvsge (size!96 (buf!405 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!2478 d!1462))

(declare-fun d!1464 () Bool)

(declare-fun e!1837 () Bool)

(assert (=> d!1464 e!1837))

(declare-fun res!4322 () Bool)

(assert (=> d!1464 (=> (not res!4322) (not e!1837))))

(declare-fun lt!2500 () (_ BitVec 64))

(declare-fun lt!2504 () (_ BitVec 64))

(declare-fun lt!2499 () (_ BitVec 64))

(assert (=> d!1464 (= res!4322 (= lt!2499 (bvsub lt!2504 lt!2500)))))

(assert (=> d!1464 (or (= (bvand lt!2504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2500 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2504 lt!2500) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1464 (= lt!2500 (remainingBits!0 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!1851)))) ((_ sign_extend 32) (currentByte!1360 (_2!109 lt!1851))) ((_ sign_extend 32) (currentBit!1355 (_2!109 lt!1851)))))))

(declare-fun lt!2503 () (_ BitVec 64))

(declare-fun lt!2502 () (_ BitVec 64))

(assert (=> d!1464 (= lt!2504 (bvmul lt!2503 lt!2502))))

(assert (=> d!1464 (or (= lt!2503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2502 (bvsdiv (bvmul lt!2503 lt!2502) lt!2503)))))

(assert (=> d!1464 (= lt!2502 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1464 (= lt!2503 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!1851)))))))

(assert (=> d!1464 (= lt!2499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1360 (_2!109 lt!1851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1355 (_2!109 lt!1851)))))))

(assert (=> d!1464 (invariant!0 (currentBit!1355 (_2!109 lt!1851)) (currentByte!1360 (_2!109 lt!1851)) (size!96 (buf!405 (_2!109 lt!1851))))))

(assert (=> d!1464 (= (bitIndex!0 (size!96 (buf!405 (_2!109 lt!1851))) (currentByte!1360 (_2!109 lt!1851)) (currentBit!1355 (_2!109 lt!1851))) lt!2499)))

(declare-fun b!2649 () Bool)

(declare-fun res!4321 () Bool)

(assert (=> b!2649 (=> (not res!4321) (not e!1837))))

(assert (=> b!2649 (= res!4321 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2499))))

(declare-fun b!2650 () Bool)

(declare-fun lt!2501 () (_ BitVec 64))

(assert (=> b!2650 (= e!1837 (bvsle lt!2499 (bvmul lt!2501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2650 (or (= lt!2501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2501)))))

(assert (=> b!2650 (= lt!2501 ((_ sign_extend 32) (size!96 (buf!405 (_2!109 lt!1851)))))))

(assert (= (and d!1464 res!4322) b!2649))

(assert (= (and b!2649 res!4321) b!2650))

(declare-fun m!2533 () Bool)

(assert (=> d!1464 m!2533))

(assert (=> d!1464 m!2141))

(assert (=> b!2483 d!1464))

(declare-fun d!1474 () Bool)

(declare-fun e!1838 () Bool)

(assert (=> d!1474 e!1838))

(declare-fun res!4324 () Bool)

(assert (=> d!1474 (=> (not res!4324) (not e!1838))))

(declare-fun lt!2506 () (_ BitVec 64))

(declare-fun lt!2510 () (_ BitVec 64))

(declare-fun lt!2505 () (_ BitVec 64))

(assert (=> d!1474 (= res!4324 (= lt!2505 (bvsub lt!2510 lt!2506)))))

(assert (=> d!1474 (or (= (bvand lt!2510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!2506 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!2510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!2510 lt!2506) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1474 (= lt!2506 (remainingBits!0 ((_ sign_extend 32) (size!96 (buf!405 thiss!1486))) ((_ sign_extend 32) (currentByte!1360 thiss!1486)) ((_ sign_extend 32) (currentBit!1355 thiss!1486))))))

(declare-fun lt!2509 () (_ BitVec 64))

(declare-fun lt!2508 () (_ BitVec 64))

(assert (=> d!1474 (= lt!2510 (bvmul lt!2509 lt!2508))))

(assert (=> d!1474 (or (= lt!2509 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!2508 (bvsdiv (bvmul lt!2509 lt!2508) lt!2509)))))

(assert (=> d!1474 (= lt!2508 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1474 (= lt!2509 ((_ sign_extend 32) (size!96 (buf!405 thiss!1486))))))

(assert (=> d!1474 (= lt!2505 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1360 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1355 thiss!1486))))))

(assert (=> d!1474 (invariant!0 (currentBit!1355 thiss!1486) (currentByte!1360 thiss!1486) (size!96 (buf!405 thiss!1486)))))

(assert (=> d!1474 (= (bitIndex!0 (size!96 (buf!405 thiss!1486)) (currentByte!1360 thiss!1486) (currentBit!1355 thiss!1486)) lt!2505)))

(declare-fun b!2651 () Bool)

(declare-fun res!4323 () Bool)

(assert (=> b!2651 (=> (not res!4323) (not e!1838))))

(assert (=> b!2651 (= res!4323 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!2505))))

(declare-fun b!2652 () Bool)

(declare-fun lt!2507 () (_ BitVec 64))

(assert (=> b!2652 (= e!1838 (bvsle lt!2505 (bvmul lt!2507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!2652 (or (= lt!2507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!2507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!2507)))))

(assert (=> b!2652 (= lt!2507 ((_ sign_extend 32) (size!96 (buf!405 thiss!1486))))))

(assert (= (and d!1474 res!4324) b!2651))

(assert (= (and b!2651 res!4323) b!2652))

(assert (=> d!1474 m!2149))

(assert (=> d!1474 m!2155))

(assert (=> b!2483 d!1474))

(push 1)

(assert (not b!2515))

(assert (not d!1410))

(assert (not b!2619))

(assert (not b!2516))

(assert (not b!2617))

(assert (not b!2613))

(assert (not d!1404))

(assert (not b!2514))

(assert (not b!2533))

(assert (not d!1426))

(assert (not bm!16))

(assert (not b!2616))

(assert (not b!2535))

(assert (not d!1444))

(assert (not d!1474))

(assert (not b!2618))

(assert (not b!2612))

(assert (not d!1420))

(assert (not d!1464))

(assert (not d!1414))

(assert (not d!1422))

(assert (not b!2512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

