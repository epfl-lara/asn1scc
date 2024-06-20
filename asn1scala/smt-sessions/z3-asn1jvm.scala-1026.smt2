; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29382 () Bool)

(assert start!29382)

(declare-fun e!101737 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!152172 () Bool)

(declare-datatypes ((array!6796 0))(
  ( (array!6797 (arr!3891 (Array (_ BitVec 32) (_ BitVec 8))) (size!3074 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5406 0))(
  ( (BitStream!5407 (buf!3571 array!6796) (currentByte!6512 (_ BitVec 32)) (currentBit!6507 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13544 0))(
  ( (tuple2!13545 (_1!7147 BitStream!5406) (_2!7147 array!6796)) )
))
(declare-fun lt!238324 () tuple2!13544)

(declare-fun arr!237 () array!6796)

(declare-fun arrayRangesEq!369 (array!6796 array!6796 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152172 (= e!101737 (not (arrayRangesEq!369 arr!237 (_2!7147 lt!238324) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!152173 () Bool)

(declare-fun res!127597 () Bool)

(declare-fun e!101741 () Bool)

(assert (=> b!152173 (=> (not res!127597) (not e!101741))))

(declare-fun thiss!1634 () BitStream!5406)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!152173 (= res!127597 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!152175 () Bool)

(declare-fun e!101738 () Bool)

(declare-fun array_inv!2863 (array!6796) Bool)

(assert (=> b!152175 (= e!101738 (array_inv!2863 (buf!3571 thiss!1634)))))

(declare-fun b!152176 () Bool)

(declare-fun res!127595 () Bool)

(assert (=> b!152176 (=> (not res!127595) (not e!101741))))

(assert (=> b!152176 (= res!127595 (bvsge from!447 to!404))))

(declare-fun b!152177 () Bool)

(declare-fun e!101739 () Bool)

(assert (=> b!152177 (= e!101739 (not e!101737))))

(declare-fun res!127596 () Bool)

(assert (=> b!152177 (=> res!127596 e!101737)))

(declare-datatypes ((tuple2!13546 0))(
  ( (tuple2!13547 (_1!7148 BitStream!5406) (_2!7148 BitStream!5406)) )
))
(declare-fun lt!238320 () tuple2!13546)

(assert (=> b!152177 (= res!127596 (or (not (= (size!3074 (_2!7147 lt!238324)) (size!3074 arr!237))) (not (= (_1!7147 lt!238324) (_2!7148 lt!238320)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5406 array!6796 (_ BitVec 32) (_ BitVec 32)) tuple2!13544)

(assert (=> b!152177 (= lt!238324 (readByteArrayLoopPure!0 (_1!7148 lt!238320) arr!237 from!447 to!404))))

(declare-fun lt!238319 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152177 (validate_offset_bits!1 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634)) lt!238319)))

(declare-datatypes ((Unit!9663 0))(
  ( (Unit!9664) )
))
(declare-fun lt!238322 () Unit!9663)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5406 array!6796 (_ BitVec 64)) Unit!9663)

(assert (=> b!152177 (= lt!238322 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3571 thiss!1634) lt!238319))))

(declare-fun reader!0 (BitStream!5406 BitStream!5406) tuple2!13546)

(assert (=> b!152177 (= lt!238320 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!152174 () Bool)

(assert (=> b!152174 (= e!101741 (not e!101739))))

(declare-fun res!127598 () Bool)

(assert (=> b!152174 (=> (not res!127598) (not e!101739))))

(declare-fun lt!238321 () (_ BitVec 64))

(assert (=> b!152174 (= res!127598 (= lt!238321 (bvadd lt!238321 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!238319))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152174 (= lt!238321 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)))))

(assert (=> b!152174 (= lt!238319 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5406 BitStream!5406) Bool)

(assert (=> b!152174 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238323 () Unit!9663)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5406) Unit!9663)

(assert (=> b!152174 (= lt!238323 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun res!127599 () Bool)

(assert (=> start!29382 (=> (not res!127599) (not e!101741))))

(assert (=> start!29382 (= res!127599 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3074 arr!237))))))

(assert (=> start!29382 e!101741))

(assert (=> start!29382 true))

(assert (=> start!29382 (array_inv!2863 arr!237)))

(declare-fun inv!12 (BitStream!5406) Bool)

(assert (=> start!29382 (and (inv!12 thiss!1634) e!101738)))

(assert (= (and start!29382 res!127599) b!152173))

(assert (= (and b!152173 res!127597) b!152176))

(assert (= (and b!152176 res!127595) b!152174))

(assert (= (and b!152174 res!127598) b!152177))

(assert (= (and b!152177 (not res!127596)) b!152172))

(assert (= start!29382 b!152175))

(declare-fun m!237889 () Bool)

(assert (=> b!152175 m!237889))

(declare-fun m!237891 () Bool)

(assert (=> b!152173 m!237891))

(declare-fun m!237893 () Bool)

(assert (=> b!152177 m!237893))

(declare-fun m!237895 () Bool)

(assert (=> b!152177 m!237895))

(declare-fun m!237897 () Bool)

(assert (=> b!152177 m!237897))

(declare-fun m!237899 () Bool)

(assert (=> b!152177 m!237899))

(declare-fun m!237901 () Bool)

(assert (=> b!152172 m!237901))

(declare-fun m!237903 () Bool)

(assert (=> start!29382 m!237903))

(declare-fun m!237905 () Bool)

(assert (=> start!29382 m!237905))

(declare-fun m!237907 () Bool)

(assert (=> b!152174 m!237907))

(declare-fun m!237909 () Bool)

(assert (=> b!152174 m!237909))

(declare-fun m!237911 () Bool)

(assert (=> b!152174 m!237911))

(check-sat (not b!152177) (not b!152173) (not start!29382) (not b!152175) (not b!152172) (not b!152174))
(check-sat)
(get-model)

(declare-fun d!49912 () Bool)

(assert (=> d!49912 (= (array_inv!2863 arr!237) (bvsge (size!3074 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29382 d!49912))

(declare-fun d!49914 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!49914 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6507 thiss!1634) (currentByte!6512 thiss!1634) (size!3074 (buf!3571 thiss!1634))))))

(declare-fun bs!12207 () Bool)

(assert (= bs!12207 d!49914))

(declare-fun m!237955 () Bool)

(assert (=> bs!12207 m!237955))

(assert (=> start!29382 d!49914))

(declare-fun d!49916 () Bool)

(declare-fun res!127631 () Bool)

(declare-fun e!101775 () Bool)

(assert (=> d!49916 (=> res!127631 e!101775)))

(assert (=> d!49916 (= res!127631 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49916 (= (arrayRangesEq!369 arr!237 (_2!7147 lt!238324) #b00000000000000000000000000000000 to!404) e!101775)))

(declare-fun b!152216 () Bool)

(declare-fun e!101776 () Bool)

(assert (=> b!152216 (= e!101775 e!101776)))

(declare-fun res!127632 () Bool)

(assert (=> b!152216 (=> (not res!127632) (not e!101776))))

(assert (=> b!152216 (= res!127632 (= (select (arr!3891 arr!237) #b00000000000000000000000000000000) (select (arr!3891 (_2!7147 lt!238324)) #b00000000000000000000000000000000)))))

(declare-fun b!152217 () Bool)

(assert (=> b!152217 (= e!101776 (arrayRangesEq!369 arr!237 (_2!7147 lt!238324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49916 (not res!127631)) b!152216))

(assert (= (and b!152216 res!127632) b!152217))

(declare-fun m!237957 () Bool)

(assert (=> b!152216 m!237957))

(declare-fun m!237959 () Bool)

(assert (=> b!152216 m!237959))

(declare-fun m!237961 () Bool)

(assert (=> b!152217 m!237961))

(assert (=> b!152172 d!49916))

(declare-fun d!49918 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49918 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12208 () Bool)

(assert (= bs!12208 d!49918))

(declare-fun m!237983 () Bool)

(assert (=> bs!12208 m!237983))

(assert (=> b!152173 d!49918))

(declare-datatypes ((tuple3!604 0))(
  ( (tuple3!605 (_1!7153 Unit!9663) (_2!7153 BitStream!5406) (_3!377 array!6796)) )
))
(declare-fun lt!238417 () tuple3!604)

(declare-fun d!49924 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5406 array!6796 (_ BitVec 32) (_ BitVec 32)) tuple3!604)

(assert (=> d!49924 (= lt!238417 (readByteArrayLoop!0 (_1!7148 lt!238320) arr!237 from!447 to!404))))

(assert (=> d!49924 (= (readByteArrayLoopPure!0 (_1!7148 lt!238320) arr!237 from!447 to!404) (tuple2!13545 (_2!7153 lt!238417) (_3!377 lt!238417)))))

(declare-fun bs!12210 () Bool)

(assert (= bs!12210 d!49924))

(declare-fun m!237987 () Bool)

(assert (=> bs!12210 m!237987))

(assert (=> b!152177 d!49924))

(declare-fun d!49928 () Bool)

(assert (=> d!49928 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634)) lt!238319) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634))) lt!238319))))

(declare-fun bs!12211 () Bool)

(assert (= bs!12211 d!49928))

(assert (=> bs!12211 m!237983))

(assert (=> b!152177 d!49928))

(declare-fun d!49930 () Bool)

(assert (=> d!49930 (validate_offset_bits!1 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634)) lt!238319)))

(declare-fun lt!238438 () Unit!9663)

(declare-fun choose!9 (BitStream!5406 array!6796 (_ BitVec 64) BitStream!5406) Unit!9663)

(assert (=> d!49930 (= lt!238438 (choose!9 thiss!1634 (buf!3571 thiss!1634) lt!238319 (BitStream!5407 (buf!3571 thiss!1634) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(assert (=> d!49930 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3571 thiss!1634) lt!238319) lt!238438)))

(declare-fun bs!12212 () Bool)

(assert (= bs!12212 d!49930))

(assert (=> bs!12212 m!237895))

(declare-fun m!237989 () Bool)

(assert (=> bs!12212 m!237989))

(assert (=> b!152177 d!49930))

(declare-fun b!152284 () Bool)

(declare-fun e!101813 () Unit!9663)

(declare-fun lt!238565 () Unit!9663)

(assert (=> b!152284 (= e!101813 lt!238565)))

(declare-fun lt!238581 () (_ BitVec 64))

(assert (=> b!152284 (= lt!238581 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!238573 () (_ BitVec 64))

(assert (=> b!152284 (= lt!238573 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6796 array!6796 (_ BitVec 64) (_ BitVec 64)) Unit!9663)

(assert (=> b!152284 (= lt!238565 (arrayBitRangesEqSymmetric!0 (buf!3571 thiss!1634) (buf!3571 thiss!1634) lt!238581 lt!238573))))

(declare-fun arrayBitRangesEq!0 (array!6796 array!6796 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152284 (arrayBitRangesEq!0 (buf!3571 thiss!1634) (buf!3571 thiss!1634) lt!238581 lt!238573)))

(declare-fun b!152285 () Bool)

(declare-fun res!127689 () Bool)

(declare-fun e!101814 () Bool)

(assert (=> b!152285 (=> (not res!127689) (not e!101814))))

(declare-fun lt!238570 () tuple2!13546)

(assert (=> b!152285 (= res!127689 (isPrefixOf!0 (_1!7148 lt!238570) thiss!1634))))

(declare-fun b!152286 () Bool)

(declare-fun res!127688 () Bool)

(assert (=> b!152286 (=> (not res!127688) (not e!101814))))

(assert (=> b!152286 (= res!127688 (isPrefixOf!0 (_2!7148 lt!238570) thiss!1634))))

(declare-fun lt!238563 () (_ BitVec 64))

(declare-fun b!152287 () Bool)

(declare-fun lt!238578 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5406 (_ BitVec 64)) BitStream!5406)

(assert (=> b!152287 (= e!101814 (= (_1!7148 lt!238570) (withMovedBitIndex!0 (_2!7148 lt!238570) (bvsub lt!238563 lt!238578))))))

(assert (=> b!152287 (or (= (bvand lt!238563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238578 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238563 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238563 lt!238578) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!152287 (= lt!238578 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)))))

(assert (=> b!152287 (= lt!238563 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)))))

(declare-fun d!49934 () Bool)

(assert (=> d!49934 e!101814))

(declare-fun res!127687 () Bool)

(assert (=> d!49934 (=> (not res!127687) (not e!101814))))

(assert (=> d!49934 (= res!127687 (isPrefixOf!0 (_1!7148 lt!238570) (_2!7148 lt!238570)))))

(declare-fun lt!238566 () BitStream!5406)

(assert (=> d!49934 (= lt!238570 (tuple2!13547 lt!238566 thiss!1634))))

(declare-fun lt!238576 () Unit!9663)

(declare-fun lt!238564 () Unit!9663)

(assert (=> d!49934 (= lt!238576 lt!238564)))

(assert (=> d!49934 (isPrefixOf!0 lt!238566 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5406 BitStream!5406 BitStream!5406) Unit!9663)

(assert (=> d!49934 (= lt!238564 (lemmaIsPrefixTransitive!0 lt!238566 thiss!1634 thiss!1634))))

(declare-fun lt!238580 () Unit!9663)

(declare-fun lt!238569 () Unit!9663)

(assert (=> d!49934 (= lt!238580 lt!238569)))

(assert (=> d!49934 (isPrefixOf!0 lt!238566 thiss!1634)))

(assert (=> d!49934 (= lt!238569 (lemmaIsPrefixTransitive!0 lt!238566 thiss!1634 thiss!1634))))

(declare-fun lt!238582 () Unit!9663)

(assert (=> d!49934 (= lt!238582 e!101813)))

(declare-fun c!8136 () Bool)

(assert (=> d!49934 (= c!8136 (not (= (size!3074 (buf!3571 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!238568 () Unit!9663)

(declare-fun lt!238574 () Unit!9663)

(assert (=> d!49934 (= lt!238568 lt!238574)))

(assert (=> d!49934 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49934 (= lt!238574 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238571 () Unit!9663)

(declare-fun lt!238572 () Unit!9663)

(assert (=> d!49934 (= lt!238571 lt!238572)))

(assert (=> d!49934 (= lt!238572 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238579 () Unit!9663)

(declare-fun lt!238567 () Unit!9663)

(assert (=> d!49934 (= lt!238579 lt!238567)))

(assert (=> d!49934 (isPrefixOf!0 lt!238566 lt!238566)))

(assert (=> d!49934 (= lt!238567 (lemmaIsPrefixRefl!0 lt!238566))))

(declare-fun lt!238577 () Unit!9663)

(declare-fun lt!238575 () Unit!9663)

(assert (=> d!49934 (= lt!238577 lt!238575)))

(assert (=> d!49934 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49934 (= lt!238575 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49934 (= lt!238566 (BitStream!5407 (buf!3571 thiss!1634) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)))))

(assert (=> d!49934 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49934 (= (reader!0 thiss!1634 thiss!1634) lt!238570)))

(declare-fun b!152288 () Bool)

(declare-fun Unit!9669 () Unit!9663)

(assert (=> b!152288 (= e!101813 Unit!9669)))

(assert (= (and d!49934 c!8136) b!152284))

(assert (= (and d!49934 (not c!8136)) b!152288))

(assert (= (and d!49934 res!127687) b!152285))

(assert (= (and b!152285 res!127689) b!152286))

(assert (= (and b!152286 res!127688) b!152287))

(declare-fun m!238027 () Bool)

(assert (=> b!152285 m!238027))

(declare-fun m!238029 () Bool)

(assert (=> b!152287 m!238029))

(assert (=> b!152287 m!237907))

(assert (=> b!152287 m!237907))

(declare-fun m!238031 () Bool)

(assert (=> b!152286 m!238031))

(assert (=> d!49934 m!237911))

(declare-fun m!238033 () Bool)

(assert (=> d!49934 m!238033))

(declare-fun m!238035 () Bool)

(assert (=> d!49934 m!238035))

(assert (=> d!49934 m!237909))

(assert (=> d!49934 m!237909))

(declare-fun m!238037 () Bool)

(assert (=> d!49934 m!238037))

(assert (=> d!49934 m!237911))

(assert (=> d!49934 m!237909))

(declare-fun m!238039 () Bool)

(assert (=> d!49934 m!238039))

(declare-fun m!238041 () Bool)

(assert (=> d!49934 m!238041))

(assert (=> d!49934 m!238035))

(assert (=> b!152284 m!237907))

(declare-fun m!238043 () Bool)

(assert (=> b!152284 m!238043))

(declare-fun m!238045 () Bool)

(assert (=> b!152284 m!238045))

(assert (=> b!152177 d!49934))

(declare-fun d!49956 () Bool)

(assert (=> d!49956 (= (array_inv!2863 (buf!3571 thiss!1634)) (bvsge (size!3074 (buf!3571 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!152175 d!49956))

(declare-fun d!49958 () Bool)

(declare-fun e!101817 () Bool)

(assert (=> d!49958 e!101817))

(declare-fun res!127695 () Bool)

(assert (=> d!49958 (=> (not res!127695) (not e!101817))))

(declare-fun lt!238597 () (_ BitVec 64))

(declare-fun lt!238598 () (_ BitVec 64))

(declare-fun lt!238599 () (_ BitVec 64))

(assert (=> d!49958 (= res!127695 (= lt!238597 (bvsub lt!238599 lt!238598)))))

(assert (=> d!49958 (or (= (bvand lt!238599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238598 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238599 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238599 lt!238598) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49958 (= lt!238598 (remainingBits!0 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634))))))

(declare-fun lt!238595 () (_ BitVec 64))

(declare-fun lt!238600 () (_ BitVec 64))

(assert (=> d!49958 (= lt!238599 (bvmul lt!238595 lt!238600))))

(assert (=> d!49958 (or (= lt!238595 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!238600 (bvsdiv (bvmul lt!238595 lt!238600) lt!238595)))))

(assert (=> d!49958 (= lt!238600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49958 (= lt!238595 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))))))

(assert (=> d!49958 (= lt!238597 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6512 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6507 thiss!1634))))))

(assert (=> d!49958 (invariant!0 (currentBit!6507 thiss!1634) (currentByte!6512 thiss!1634) (size!3074 (buf!3571 thiss!1634)))))

(assert (=> d!49958 (= (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)) lt!238597)))

(declare-fun b!152293 () Bool)

(declare-fun res!127694 () Bool)

(assert (=> b!152293 (=> (not res!127694) (not e!101817))))

(assert (=> b!152293 (= res!127694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238597))))

(declare-fun b!152294 () Bool)

(declare-fun lt!238596 () (_ BitVec 64))

(assert (=> b!152294 (= e!101817 (bvsle lt!238597 (bvmul lt!238596 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152294 (or (= lt!238596 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238596 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238596)))))

(assert (=> b!152294 (= lt!238596 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))))))

(assert (= (and d!49958 res!127695) b!152293))

(assert (= (and b!152293 res!127694) b!152294))

(assert (=> d!49958 m!237983))

(assert (=> d!49958 m!237955))

(assert (=> b!152174 d!49958))

(declare-fun d!49960 () Bool)

(declare-fun res!127704 () Bool)

(declare-fun e!101823 () Bool)

(assert (=> d!49960 (=> (not res!127704) (not e!101823))))

(assert (=> d!49960 (= res!127704 (= (size!3074 (buf!3571 thiss!1634)) (size!3074 (buf!3571 thiss!1634))))))

(assert (=> d!49960 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101823)))

(declare-fun b!152301 () Bool)

(declare-fun res!127702 () Bool)

(assert (=> b!152301 (=> (not res!127702) (not e!101823))))

(assert (=> b!152301 (= res!127702 (bvsle (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)) (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(declare-fun b!152302 () Bool)

(declare-fun e!101822 () Bool)

(assert (=> b!152302 (= e!101823 e!101822)))

(declare-fun res!127703 () Bool)

(assert (=> b!152302 (=> res!127703 e!101822)))

(assert (=> b!152302 (= res!127703 (= (size!3074 (buf!3571 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!152303 () Bool)

(assert (=> b!152303 (= e!101822 (arrayBitRangesEq!0 (buf!3571 thiss!1634) (buf!3571 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(assert (= (and d!49960 res!127704) b!152301))

(assert (= (and b!152301 res!127702) b!152302))

(assert (= (and b!152302 (not res!127703)) b!152303))

(assert (=> b!152301 m!237907))

(assert (=> b!152301 m!237907))

(assert (=> b!152303 m!237907))

(assert (=> b!152303 m!237907))

(declare-fun m!238047 () Bool)

(assert (=> b!152303 m!238047))

(assert (=> b!152174 d!49960))

(declare-fun d!49962 () Bool)

(assert (=> d!49962 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238603 () Unit!9663)

(declare-fun choose!11 (BitStream!5406) Unit!9663)

(assert (=> d!49962 (= lt!238603 (choose!11 thiss!1634))))

(assert (=> d!49962 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!238603)))

(declare-fun bs!12220 () Bool)

(assert (= bs!12220 d!49962))

(assert (=> bs!12220 m!237909))

(declare-fun m!238049 () Bool)

(assert (=> bs!12220 m!238049))

(assert (=> b!152174 d!49962))

(check-sat (not d!49914) (not d!49928) (not d!49918) (not b!152303) (not b!152284) (not d!49958) (not b!152286) (not d!49924) (not d!49934) (not d!49962) (not b!152301) (not b!152287) (not b!152217) (not b!152285) (not d!49930))
(check-sat)
(get-model)

(declare-fun d!49964 () Bool)

(declare-fun e!101826 () Bool)

(assert (=> d!49964 e!101826))

(declare-fun res!127707 () Bool)

(assert (=> d!49964 (=> (not res!127707) (not e!101826))))

(declare-fun lt!238609 () (_ BitVec 64))

(declare-fun lt!238608 () BitStream!5406)

(assert (=> d!49964 (= res!127707 (= (bvadd lt!238609 (bvsub lt!238563 lt!238578)) (bitIndex!0 (size!3074 (buf!3571 lt!238608)) (currentByte!6512 lt!238608) (currentBit!6507 lt!238608))))))

(assert (=> d!49964 (or (not (= (bvand lt!238609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238563 lt!238578) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!238609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!238609 (bvsub lt!238563 lt!238578)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49964 (= lt!238609 (bitIndex!0 (size!3074 (buf!3571 (_2!7148 lt!238570))) (currentByte!6512 (_2!7148 lt!238570)) (currentBit!6507 (_2!7148 lt!238570))))))

(declare-datatypes ((tuple2!13552 0))(
  ( (tuple2!13553 (_1!7154 Unit!9663) (_2!7154 BitStream!5406)) )
))
(declare-fun moveBitIndex!0 (BitStream!5406 (_ BitVec 64)) tuple2!13552)

(assert (=> d!49964 (= lt!238608 (_2!7154 (moveBitIndex!0 (_2!7148 lt!238570) (bvsub lt!238563 lt!238578))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5406 (_ BitVec 64)) Bool)

(assert (=> d!49964 (moveBitIndexPrecond!0 (_2!7148 lt!238570) (bvsub lt!238563 lt!238578))))

(assert (=> d!49964 (= (withMovedBitIndex!0 (_2!7148 lt!238570) (bvsub lt!238563 lt!238578)) lt!238608)))

(declare-fun b!152306 () Bool)

(assert (=> b!152306 (= e!101826 (= (size!3074 (buf!3571 (_2!7148 lt!238570))) (size!3074 (buf!3571 lt!238608))))))

(assert (= (and d!49964 res!127707) b!152306))

(declare-fun m!238051 () Bool)

(assert (=> d!49964 m!238051))

(declare-fun m!238053 () Bool)

(assert (=> d!49964 m!238053))

(declare-fun m!238055 () Bool)

(assert (=> d!49964 m!238055))

(declare-fun m!238057 () Bool)

(assert (=> d!49964 m!238057))

(assert (=> b!152287 d!49964))

(assert (=> b!152287 d!49958))

(declare-fun d!49966 () Bool)

(assert (=> d!49966 (= (remainingBits!0 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6512 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6507 thiss!1634)))))))

(assert (=> d!49928 d!49966))

(assert (=> d!49962 d!49960))

(declare-fun d!49968 () Bool)

(assert (=> d!49968 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49968 true))

(declare-fun _$14!268 () Unit!9663)

(assert (=> d!49968 (= (choose!11 thiss!1634) _$14!268)))

(declare-fun bs!12222 () Bool)

(assert (= bs!12222 d!49968))

(assert (=> bs!12222 m!237909))

(assert (=> d!49962 d!49968))

(declare-fun d!49970 () Bool)

(declare-fun res!127710 () Bool)

(declare-fun e!101828 () Bool)

(assert (=> d!49970 (=> (not res!127710) (not e!101828))))

(assert (=> d!49970 (= res!127710 (= (size!3074 (buf!3571 (_2!7148 lt!238570))) (size!3074 (buf!3571 thiss!1634))))))

(assert (=> d!49970 (= (isPrefixOf!0 (_2!7148 lt!238570) thiss!1634) e!101828)))

(declare-fun b!152307 () Bool)

(declare-fun res!127708 () Bool)

(assert (=> b!152307 (=> (not res!127708) (not e!101828))))

(assert (=> b!152307 (= res!127708 (bvsle (bitIndex!0 (size!3074 (buf!3571 (_2!7148 lt!238570))) (currentByte!6512 (_2!7148 lt!238570)) (currentBit!6507 (_2!7148 lt!238570))) (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(declare-fun b!152308 () Bool)

(declare-fun e!101827 () Bool)

(assert (=> b!152308 (= e!101828 e!101827)))

(declare-fun res!127709 () Bool)

(assert (=> b!152308 (=> res!127709 e!101827)))

(assert (=> b!152308 (= res!127709 (= (size!3074 (buf!3571 (_2!7148 lt!238570))) #b00000000000000000000000000000000))))

(declare-fun b!152309 () Bool)

(assert (=> b!152309 (= e!101827 (arrayBitRangesEq!0 (buf!3571 (_2!7148 lt!238570)) (buf!3571 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 (_2!7148 lt!238570))) (currentByte!6512 (_2!7148 lt!238570)) (currentBit!6507 (_2!7148 lt!238570)))))))

(assert (= (and d!49970 res!127710) b!152307))

(assert (= (and b!152307 res!127708) b!152308))

(assert (= (and b!152308 (not res!127709)) b!152309))

(assert (=> b!152307 m!238053))

(assert (=> b!152307 m!237907))

(assert (=> b!152309 m!238053))

(assert (=> b!152309 m!238053))

(declare-fun m!238059 () Bool)

(assert (=> b!152309 m!238059))

(assert (=> b!152286 d!49970))

(declare-fun b!152320 () Bool)

(declare-fun lt!238713 () tuple3!604)

(declare-fun e!101835 () Bool)

(declare-datatypes ((tuple2!13554 0))(
  ( (tuple2!13555 (_1!7155 BitStream!5406) (_2!7155 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5406) tuple2!13554)

(assert (=> b!152320 (= e!101835 (= (select (arr!3891 (_3!377 lt!238713)) from!447) (_2!7155 (readBytePure!0 (_1!7148 lt!238320)))))))

(assert (=> b!152320 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!3074 (_3!377 lt!238713))))))

(declare-fun bm!2106 () Bool)

(declare-fun call!2109 () Bool)

(declare-fun lt!238718 () (_ BitVec 32))

(declare-fun lt!238703 () tuple3!604)

(declare-fun c!8139 () Bool)

(assert (=> bm!2106 (= call!2109 (arrayRangesEq!369 arr!237 (ite c!8139 (_3!377 lt!238703) arr!237) (ite c!8139 lt!238718 #b00000000000000000000000000000000) (ite c!8139 from!447 (size!3074 arr!237))))))

(declare-fun lt!238688 () Unit!9663)

(declare-fun e!101836 () tuple3!604)

(declare-fun b!152321 () Bool)

(assert (=> b!152321 (= e!101836 (tuple3!605 lt!238688 (_1!7148 lt!238320) arr!237))))

(declare-fun call!2111 () (_ BitVec 64))

(assert (=> b!152321 (= call!2111 call!2111)))

(declare-fun lt!238706 () Unit!9663)

(declare-fun Unit!9670 () Unit!9663)

(assert (=> b!152321 (= lt!238706 Unit!9670)))

(declare-fun lt!238695 () Unit!9663)

(declare-fun arrayRangesEqReflexiveLemma!18 (array!6796) Unit!9663)

(assert (=> b!152321 (= lt!238695 (arrayRangesEqReflexiveLemma!18 arr!237))))

(assert (=> b!152321 call!2109))

(declare-fun lt!238696 () Unit!9663)

(assert (=> b!152321 (= lt!238696 lt!238695)))

(declare-fun lt!238694 () array!6796)

(assert (=> b!152321 (= lt!238694 arr!237)))

(declare-fun lt!238710 () array!6796)

(assert (=> b!152321 (= lt!238710 arr!237)))

(declare-fun lt!238704 () (_ BitVec 32))

(assert (=> b!152321 (= lt!238704 #b00000000000000000000000000000000)))

(declare-fun lt!238708 () (_ BitVec 32))

(assert (=> b!152321 (= lt!238708 (size!3074 arr!237))))

(declare-fun lt!238698 () (_ BitVec 32))

(assert (=> b!152321 (= lt!238698 #b00000000000000000000000000000000)))

(declare-fun lt!238687 () (_ BitVec 32))

(assert (=> b!152321 (= lt!238687 from!447)))

(declare-fun arrayRangesEqSlicedLemma!18 (array!6796 array!6796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9663)

(assert (=> b!152321 (= lt!238688 (arrayRangesEqSlicedLemma!18 lt!238694 lt!238710 lt!238704 lt!238708 lt!238698 lt!238687))))

(declare-fun call!2110 () Bool)

(assert (=> b!152321 call!2110))

(declare-fun b!152322 () Bool)

(declare-fun res!127717 () Bool)

(declare-fun e!101837 () Bool)

(assert (=> b!152322 (=> (not res!127717) (not e!101837))))

(assert (=> b!152322 (= res!127717 (and (= (buf!3571 (_1!7148 lt!238320)) (buf!3571 (_2!7153 lt!238713))) (= (size!3074 arr!237) (size!3074 (_3!377 lt!238713)))))))

(declare-fun b!152323 () Bool)

(declare-fun lt!238685 () Unit!9663)

(assert (=> b!152323 (= e!101836 (tuple3!605 lt!238685 (_2!7153 lt!238703) (_3!377 lt!238703)))))

(declare-datatypes ((tuple2!13556 0))(
  ( (tuple2!13557 (_1!7156 (_ BitVec 8)) (_2!7156 BitStream!5406)) )
))
(declare-fun lt!238719 () tuple2!13556)

(declare-fun readByte!0 (BitStream!5406) tuple2!13556)

(assert (=> b!152323 (= lt!238719 (readByte!0 (_1!7148 lt!238320)))))

(declare-fun lt!238709 () array!6796)

(assert (=> b!152323 (= lt!238709 (array!6797 (store (arr!3891 arr!237) from!447 (_1!7156 lt!238719)) (size!3074 arr!237)))))

(declare-fun lt!238711 () (_ BitVec 64))

(assert (=> b!152323 (= lt!238711 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!238702 () (_ BitVec 32))

(assert (=> b!152323 (= lt!238702 (bvsub to!404 from!447))))

(declare-fun lt!238717 () Unit!9663)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5406 BitStream!5406 (_ BitVec 64) (_ BitVec 32)) Unit!9663)

(assert (=> b!152323 (= lt!238717 (validateOffsetBytesFromBitIndexLemma!0 (_1!7148 lt!238320) (_2!7156 lt!238719) lt!238711 lt!238702))))

(assert (=> b!152323 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3074 (buf!3571 (_2!7156 lt!238719)))) ((_ sign_extend 32) (currentByte!6512 (_2!7156 lt!238719))) ((_ sign_extend 32) (currentBit!6507 (_2!7156 lt!238719))) (bvsub lt!238702 ((_ extract 31 0) (bvsdiv (bvadd lt!238711 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!238701 () Unit!9663)

(assert (=> b!152323 (= lt!238701 lt!238717)))

(assert (=> b!152323 (= lt!238703 (readByteArrayLoop!0 (_2!7156 lt!238719) lt!238709 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> b!152323 (= (bitIndex!0 (size!3074 (buf!3571 (_2!7156 lt!238719))) (currentByte!6512 (_2!7156 lt!238719)) (currentBit!6507 (_2!7156 lt!238719))) (bvadd call!2111 #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!238712 () Unit!9663)

(declare-fun Unit!9671 () Unit!9663)

(assert (=> b!152323 (= lt!238712 Unit!9671)))

(assert (=> b!152323 (= (bvadd (bitIndex!0 (size!3074 (buf!3571 (_2!7156 lt!238719))) (currentByte!6512 (_2!7156 lt!238719)) (currentBit!6507 (_2!7156 lt!238719))) (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3074 (buf!3571 (_2!7153 lt!238703))) (currentByte!6512 (_2!7153 lt!238703)) (currentBit!6507 (_2!7153 lt!238703))))))

(declare-fun lt!238699 () Unit!9663)

(declare-fun Unit!9672 () Unit!9663)

(assert (=> b!152323 (= lt!238699 Unit!9672)))

(assert (=> b!152323 (= (bvadd call!2111 (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!3074 (buf!3571 (_2!7153 lt!238703))) (currentByte!6512 (_2!7153 lt!238703)) (currentBit!6507 (_2!7153 lt!238703))))))

(declare-fun lt!238716 () Unit!9663)

(declare-fun Unit!9673 () Unit!9663)

(assert (=> b!152323 (= lt!238716 Unit!9673)))

(assert (=> b!152323 (and (= (buf!3571 (_1!7148 lt!238320)) (buf!3571 (_2!7153 lt!238703))) (= (size!3074 arr!237) (size!3074 (_3!377 lt!238703))))))

(declare-fun lt!238700 () Unit!9663)

(declare-fun Unit!9674 () Unit!9663)

(assert (=> b!152323 (= lt!238700 Unit!9674)))

(declare-fun lt!238720 () Unit!9663)

(declare-fun arrayUpdatedAtPrefixLemma!18 (array!6796 (_ BitVec 32) (_ BitVec 8)) Unit!9663)

(assert (=> b!152323 (= lt!238720 (arrayUpdatedAtPrefixLemma!18 arr!237 from!447 (_1!7156 lt!238719)))))

(assert (=> b!152323 call!2110))

(declare-fun lt!238692 () Unit!9663)

(assert (=> b!152323 (= lt!238692 lt!238720)))

(assert (=> b!152323 (= lt!238718 #b00000000000000000000000000000000)))

(declare-fun lt!238707 () Unit!9663)

(declare-fun arrayRangesEqTransitive!83 (array!6796 array!6796 array!6796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9663)

(assert (=> b!152323 (= lt!238707 (arrayRangesEqTransitive!83 arr!237 lt!238709 (_3!377 lt!238703) lt!238718 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!152323 call!2109))

(declare-fun lt!238705 () Unit!9663)

(assert (=> b!152323 (= lt!238705 lt!238707)))

(assert (=> b!152323 (arrayRangesEq!369 arr!237 (_3!377 lt!238703) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!238697 () Unit!9663)

(declare-fun Unit!9675 () Unit!9663)

(assert (=> b!152323 (= lt!238697 Unit!9675)))

(declare-fun lt!238689 () Unit!9663)

(declare-fun arrayRangesEqImpliesEq!18 (array!6796 array!6796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9663)

(assert (=> b!152323 (= lt!238689 (arrayRangesEqImpliesEq!18 lt!238709 (_3!377 lt!238703) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!152323 (= (select (store (arr!3891 arr!237) from!447 (_1!7156 lt!238719)) from!447) (select (arr!3891 (_3!377 lt!238703)) from!447))))

(declare-fun lt!238691 () Unit!9663)

(assert (=> b!152323 (= lt!238691 lt!238689)))

(declare-fun lt!238715 () Bool)

(assert (=> b!152323 (= lt!238715 (= (select (arr!3891 (_3!377 lt!238703)) from!447) (_1!7156 lt!238719)))))

(declare-fun Unit!9676 () Unit!9663)

(assert (=> b!152323 (= lt!238685 Unit!9676)))

(assert (=> b!152323 lt!238715))

(declare-fun b!152324 () Bool)

(assert (=> b!152324 (= e!101837 (arrayRangesEq!369 arr!237 (_3!377 lt!238713) #b00000000000000000000000000000000 from!447))))

(declare-fun bm!2108 () Bool)

(assert (=> bm!2108 (= call!2111 (bitIndex!0 (size!3074 (buf!3571 (_1!7148 lt!238320))) (currentByte!6512 (_1!7148 lt!238320)) (currentBit!6507 (_1!7148 lt!238320))))))

(declare-fun d!49972 () Bool)

(assert (=> d!49972 e!101835))

(declare-fun res!127719 () Bool)

(assert (=> d!49972 (=> res!127719 e!101835)))

(assert (=> d!49972 (= res!127719 (bvsge from!447 to!404))))

(declare-fun lt!238714 () Bool)

(assert (=> d!49972 (= lt!238714 e!101837)))

(declare-fun res!127718 () Bool)

(assert (=> d!49972 (=> (not res!127718) (not e!101837))))

(declare-fun lt!238693 () (_ BitVec 64))

(declare-fun lt!238690 () (_ BitVec 64))

(assert (=> d!49972 (= res!127718 (= (bvadd lt!238693 lt!238690) (bitIndex!0 (size!3074 (buf!3571 (_2!7153 lt!238713))) (currentByte!6512 (_2!7153 lt!238713)) (currentBit!6507 (_2!7153 lt!238713)))))))

(assert (=> d!49972 (or (not (= (bvand lt!238693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238690 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!238693 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!238693 lt!238690) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238686 () (_ BitVec 64))

(assert (=> d!49972 (= lt!238690 (bvmul lt!238686 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!49972 (or (= lt!238686 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238686 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238686)))))

(assert (=> d!49972 (= lt!238686 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!49972 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!49972 (= lt!238693 (bitIndex!0 (size!3074 (buf!3571 (_1!7148 lt!238320))) (currentByte!6512 (_1!7148 lt!238320)) (currentBit!6507 (_1!7148 lt!238320))))))

(assert (=> d!49972 (= lt!238713 e!101836)))

(assert (=> d!49972 (= c!8139 (bvslt from!447 to!404))))

(assert (=> d!49972 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3074 arr!237)))))

(assert (=> d!49972 (= (readByteArrayLoop!0 (_1!7148 lt!238320) arr!237 from!447 to!404) lt!238713)))

(declare-fun bm!2107 () Bool)

(assert (=> bm!2107 (= call!2110 (arrayRangesEq!369 (ite c!8139 arr!237 lt!238694) (ite c!8139 (array!6797 (store (arr!3891 arr!237) from!447 (_1!7156 lt!238719)) (size!3074 arr!237)) lt!238710) (ite c!8139 #b00000000000000000000000000000000 lt!238698) (ite c!8139 from!447 lt!238687)))))

(assert (= (and d!49972 c!8139) b!152323))

(assert (= (and d!49972 (not c!8139)) b!152321))

(assert (= (or b!152323 b!152321) bm!2107))

(assert (= (or b!152323 b!152321) bm!2106))

(assert (= (or b!152323 b!152321) bm!2108))

(assert (= (and d!49972 res!127718) b!152322))

(assert (= (and b!152322 res!127717) b!152324))

(assert (= (and d!49972 (not res!127719)) b!152320))

(declare-fun m!238063 () Bool)

(assert (=> bm!2108 m!238063))

(declare-fun m!238065 () Bool)

(assert (=> b!152320 m!238065))

(declare-fun m!238067 () Bool)

(assert (=> b!152320 m!238067))

(declare-fun m!238069 () Bool)

(assert (=> bm!2107 m!238069))

(declare-fun m!238071 () Bool)

(assert (=> bm!2107 m!238071))

(declare-fun m!238073 () Bool)

(assert (=> b!152323 m!238073))

(assert (=> b!152323 m!238069))

(declare-fun m!238075 () Bool)

(assert (=> b!152323 m!238075))

(declare-fun m!238077 () Bool)

(assert (=> b!152323 m!238077))

(declare-fun m!238079 () Bool)

(assert (=> b!152323 m!238079))

(declare-fun m!238081 () Bool)

(assert (=> b!152323 m!238081))

(declare-fun m!238083 () Bool)

(assert (=> b!152323 m!238083))

(declare-fun m!238085 () Bool)

(assert (=> b!152323 m!238085))

(declare-fun m!238087 () Bool)

(assert (=> b!152323 m!238087))

(declare-fun m!238089 () Bool)

(assert (=> b!152323 m!238089))

(declare-fun m!238091 () Bool)

(assert (=> b!152323 m!238091))

(declare-fun m!238093 () Bool)

(assert (=> b!152323 m!238093))

(declare-fun m!238095 () Bool)

(assert (=> b!152323 m!238095))

(declare-fun m!238097 () Bool)

(assert (=> d!49972 m!238097))

(assert (=> d!49972 m!238063))

(declare-fun m!238099 () Bool)

(assert (=> bm!2106 m!238099))

(declare-fun m!238101 () Bool)

(assert (=> b!152324 m!238101))

(declare-fun m!238103 () Bool)

(assert (=> b!152321 m!238103))

(declare-fun m!238105 () Bool)

(assert (=> b!152321 m!238105))

(assert (=> d!49924 d!49972))

(assert (=> d!49958 d!49966))

(declare-fun d!49980 () Bool)

(assert (=> d!49980 (= (invariant!0 (currentBit!6507 thiss!1634) (currentByte!6512 thiss!1634) (size!3074 (buf!3571 thiss!1634))) (and (bvsge (currentBit!6507 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6507 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6512 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6512 thiss!1634) (size!3074 (buf!3571 thiss!1634))) (and (= (currentBit!6507 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6512 thiss!1634) (size!3074 (buf!3571 thiss!1634)))))))))

(assert (=> d!49958 d!49980))

(assert (=> d!49918 d!49966))

(assert (=> d!49914 d!49980))

(assert (=> d!49930 d!49928))

(declare-fun d!49982 () Bool)

(assert (=> d!49982 (validate_offset_bits!1 ((_ sign_extend 32) (size!3074 (buf!3571 thiss!1634))) ((_ sign_extend 32) (currentByte!6512 thiss!1634)) ((_ sign_extend 32) (currentBit!6507 thiss!1634)) lt!238319)))

(assert (=> d!49982 true))

(declare-fun _$6!345 () Unit!9663)

(assert (=> d!49982 (= (choose!9 thiss!1634 (buf!3571 thiss!1634) lt!238319 (BitStream!5407 (buf!3571 thiss!1634) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))) _$6!345)))

(declare-fun bs!12226 () Bool)

(assert (= bs!12226 d!49982))

(assert (=> bs!12226 m!237895))

(assert (=> d!49930 d!49982))

(assert (=> b!152301 d!49958))

(declare-fun d!49986 () Bool)

(declare-fun res!127735 () Bool)

(declare-fun e!101856 () Bool)

(assert (=> d!49986 (=> res!127735 e!101856)))

(assert (=> d!49986 (= res!127735 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49986 (= (arrayRangesEq!369 arr!237 (_2!7147 lt!238324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!101856)))

(declare-fun b!152346 () Bool)

(declare-fun e!101857 () Bool)

(assert (=> b!152346 (= e!101856 e!101857)))

(declare-fun res!127736 () Bool)

(assert (=> b!152346 (=> (not res!127736) (not e!101857))))

(assert (=> b!152346 (= res!127736 (= (select (arr!3891 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3891 (_2!7147 lt!238324)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!152347 () Bool)

(assert (=> b!152347 (= e!101857 (arrayRangesEq!369 arr!237 (_2!7147 lt!238324) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49986 (not res!127735)) b!152346))

(assert (= (and b!152346 res!127736) b!152347))

(declare-fun m!238119 () Bool)

(assert (=> b!152346 m!238119))

(declare-fun m!238121 () Bool)

(assert (=> b!152346 m!238121))

(declare-fun m!238123 () Bool)

(assert (=> b!152347 m!238123))

(assert (=> b!152217 d!49986))

(declare-fun b!152377 () Bool)

(declare-fun e!101884 () Bool)

(declare-fun call!2117 () Bool)

(assert (=> b!152377 (= e!101884 call!2117)))

(declare-fun b!152378 () Bool)

(declare-fun e!101886 () Bool)

(assert (=> b!152378 (= e!101886 e!101884)))

(declare-fun c!8145 () Bool)

(declare-datatypes ((tuple4!150 0))(
  ( (tuple4!151 (_1!7157 (_ BitVec 32)) (_2!7157 (_ BitVec 32)) (_3!378 (_ BitVec 32)) (_4!75 (_ BitVec 32))) )
))
(declare-fun lt!238745 () tuple4!150)

(assert (=> b!152378 (= c!8145 (= (_3!378 lt!238745) (_4!75 lt!238745)))))

(declare-fun b!152379 () Bool)

(declare-fun lt!238747 () (_ BitVec 32))

(declare-fun e!101883 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152379 (= e!101883 (byteRangesEq!0 (select (arr!3891 (buf!3571 thiss!1634)) (_4!75 lt!238745)) (select (arr!3891 (buf!3571 thiss!1634)) (_4!75 lt!238745)) #b00000000000000000000000000000000 lt!238747))))

(declare-fun lt!238746 () (_ BitVec 32))

(declare-fun bm!2114 () Bool)

(assert (=> bm!2114 (= call!2117 (byteRangesEq!0 (select (arr!3891 (buf!3571 thiss!1634)) (_3!378 lt!238745)) (select (arr!3891 (buf!3571 thiss!1634)) (_3!378 lt!238745)) lt!238746 (ite c!8145 lt!238747 #b00000000000000000000000000001000)))))

(declare-fun b!152380 () Bool)

(declare-fun res!127766 () Bool)

(assert (=> b!152380 (= res!127766 (= lt!238747 #b00000000000000000000000000000000))))

(assert (=> b!152380 (=> res!127766 e!101883)))

(declare-fun e!101881 () Bool)

(assert (=> b!152380 (= e!101881 e!101883)))

(declare-fun b!152381 () Bool)

(declare-fun e!101885 () Bool)

(assert (=> b!152381 (= e!101885 (arrayRangesEq!369 (buf!3571 thiss!1634) (buf!3571 thiss!1634) (_1!7157 lt!238745) (_2!7157 lt!238745)))))

(declare-fun d!49990 () Bool)

(declare-fun res!127763 () Bool)

(declare-fun e!101882 () Bool)

(assert (=> d!49990 (=> res!127763 e!101882)))

(assert (=> d!49990 (= res!127763 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(assert (=> d!49990 (= (arrayBitRangesEq!0 (buf!3571 thiss!1634) (buf!3571 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))) e!101882)))

(declare-fun b!152382 () Bool)

(assert (=> b!152382 (= e!101882 e!101886)))

(declare-fun res!127764 () Bool)

(assert (=> b!152382 (=> (not res!127764) (not e!101886))))

(assert (=> b!152382 (= res!127764 e!101885)))

(declare-fun res!127762 () Bool)

(assert (=> b!152382 (=> res!127762 e!101885)))

(assert (=> b!152382 (= res!127762 (bvsge (_1!7157 lt!238745) (_2!7157 lt!238745)))))

(assert (=> b!152382 (= lt!238747 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152382 (= lt!238746 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!150)

(assert (=> b!152382 (= lt!238745 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(declare-fun b!152383 () Bool)

(assert (=> b!152383 (= e!101884 e!101881)))

(declare-fun res!127765 () Bool)

(assert (=> b!152383 (= res!127765 call!2117)))

(assert (=> b!152383 (=> (not res!127765) (not e!101881))))

(assert (= (and d!49990 (not res!127763)) b!152382))

(assert (= (and b!152382 (not res!127762)) b!152381))

(assert (= (and b!152382 res!127764) b!152378))

(assert (= (and b!152378 c!8145) b!152377))

(assert (= (and b!152378 (not c!8145)) b!152383))

(assert (= (and b!152383 res!127765) b!152380))

(assert (= (and b!152380 (not res!127766)) b!152379))

(assert (= (or b!152377 b!152383) bm!2114))

(declare-fun m!238149 () Bool)

(assert (=> b!152379 m!238149))

(assert (=> b!152379 m!238149))

(assert (=> b!152379 m!238149))

(assert (=> b!152379 m!238149))

(declare-fun m!238151 () Bool)

(assert (=> b!152379 m!238151))

(declare-fun m!238153 () Bool)

(assert (=> bm!2114 m!238153))

(assert (=> bm!2114 m!238153))

(assert (=> bm!2114 m!238153))

(assert (=> bm!2114 m!238153))

(declare-fun m!238155 () Bool)

(assert (=> bm!2114 m!238155))

(declare-fun m!238157 () Bool)

(assert (=> b!152381 m!238157))

(assert (=> b!152382 m!237907))

(declare-fun m!238159 () Bool)

(assert (=> b!152382 m!238159))

(assert (=> b!152303 d!49990))

(assert (=> b!152303 d!49958))

(declare-fun d!50008 () Bool)

(declare-fun res!127774 () Bool)

(declare-fun e!101894 () Bool)

(assert (=> d!50008 (=> (not res!127774) (not e!101894))))

(assert (=> d!50008 (= res!127774 (= (size!3074 (buf!3571 (_1!7148 lt!238570))) (size!3074 (buf!3571 thiss!1634))))))

(assert (=> d!50008 (= (isPrefixOf!0 (_1!7148 lt!238570) thiss!1634) e!101894)))

(declare-fun b!152391 () Bool)

(declare-fun res!127772 () Bool)

(assert (=> b!152391 (=> (not res!127772) (not e!101894))))

(assert (=> b!152391 (= res!127772 (bvsle (bitIndex!0 (size!3074 (buf!3571 (_1!7148 lt!238570))) (currentByte!6512 (_1!7148 lt!238570)) (currentBit!6507 (_1!7148 lt!238570))) (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(declare-fun b!152392 () Bool)

(declare-fun e!101893 () Bool)

(assert (=> b!152392 (= e!101894 e!101893)))

(declare-fun res!127773 () Bool)

(assert (=> b!152392 (=> res!127773 e!101893)))

(assert (=> b!152392 (= res!127773 (= (size!3074 (buf!3571 (_1!7148 lt!238570))) #b00000000000000000000000000000000))))

(declare-fun b!152393 () Bool)

(assert (=> b!152393 (= e!101893 (arrayBitRangesEq!0 (buf!3571 (_1!7148 lt!238570)) (buf!3571 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 (_1!7148 lt!238570))) (currentByte!6512 (_1!7148 lt!238570)) (currentBit!6507 (_1!7148 lt!238570)))))))

(assert (= (and d!50008 res!127774) b!152391))

(assert (= (and b!152391 res!127772) b!152392))

(assert (= (and b!152392 (not res!127773)) b!152393))

(declare-fun m!238169 () Bool)

(assert (=> b!152391 m!238169))

(assert (=> b!152391 m!237907))

(assert (=> b!152393 m!238169))

(assert (=> b!152393 m!238169))

(declare-fun m!238175 () Bool)

(assert (=> b!152393 m!238175))

(assert (=> b!152285 d!50008))

(declare-fun d!50012 () Bool)

(assert (=> d!50012 (isPrefixOf!0 lt!238566 thiss!1634)))

(declare-fun lt!238754 () Unit!9663)

(declare-fun choose!30 (BitStream!5406 BitStream!5406 BitStream!5406) Unit!9663)

(assert (=> d!50012 (= lt!238754 (choose!30 lt!238566 thiss!1634 thiss!1634))))

(assert (=> d!50012 (isPrefixOf!0 lt!238566 thiss!1634)))

(assert (=> d!50012 (= (lemmaIsPrefixTransitive!0 lt!238566 thiss!1634 thiss!1634) lt!238754)))

(declare-fun bs!12230 () Bool)

(assert (= bs!12230 d!50012))

(assert (=> bs!12230 m!238037))

(declare-fun m!238185 () Bool)

(assert (=> bs!12230 m!238185))

(assert (=> bs!12230 m!238037))

(assert (=> d!49934 d!50012))

(declare-fun d!50020 () Bool)

(assert (=> d!50020 (isPrefixOf!0 lt!238566 lt!238566)))

(declare-fun lt!238755 () Unit!9663)

(assert (=> d!50020 (= lt!238755 (choose!11 lt!238566))))

(assert (=> d!50020 (= (lemmaIsPrefixRefl!0 lt!238566) lt!238755)))

(declare-fun bs!12231 () Bool)

(assert (= bs!12231 d!50020))

(assert (=> bs!12231 m!238033))

(declare-fun m!238187 () Bool)

(assert (=> bs!12231 m!238187))

(assert (=> d!49934 d!50020))

(declare-fun d!50022 () Bool)

(declare-fun res!127782 () Bool)

(declare-fun e!101900 () Bool)

(assert (=> d!50022 (=> (not res!127782) (not e!101900))))

(assert (=> d!50022 (= res!127782 (= (size!3074 (buf!3571 (_1!7148 lt!238570))) (size!3074 (buf!3571 (_2!7148 lt!238570)))))))

(assert (=> d!50022 (= (isPrefixOf!0 (_1!7148 lt!238570) (_2!7148 lt!238570)) e!101900)))

(declare-fun b!152399 () Bool)

(declare-fun res!127780 () Bool)

(assert (=> b!152399 (=> (not res!127780) (not e!101900))))

(assert (=> b!152399 (= res!127780 (bvsle (bitIndex!0 (size!3074 (buf!3571 (_1!7148 lt!238570))) (currentByte!6512 (_1!7148 lt!238570)) (currentBit!6507 (_1!7148 lt!238570))) (bitIndex!0 (size!3074 (buf!3571 (_2!7148 lt!238570))) (currentByte!6512 (_2!7148 lt!238570)) (currentBit!6507 (_2!7148 lt!238570)))))))

(declare-fun b!152400 () Bool)

(declare-fun e!101899 () Bool)

(assert (=> b!152400 (= e!101900 e!101899)))

(declare-fun res!127781 () Bool)

(assert (=> b!152400 (=> res!127781 e!101899)))

(assert (=> b!152400 (= res!127781 (= (size!3074 (buf!3571 (_1!7148 lt!238570))) #b00000000000000000000000000000000))))

(declare-fun b!152401 () Bool)

(assert (=> b!152401 (= e!101899 (arrayBitRangesEq!0 (buf!3571 (_1!7148 lt!238570)) (buf!3571 (_2!7148 lt!238570)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 (_1!7148 lt!238570))) (currentByte!6512 (_1!7148 lt!238570)) (currentBit!6507 (_1!7148 lt!238570)))))))

(assert (= (and d!50022 res!127782) b!152399))

(assert (= (and b!152399 res!127780) b!152400))

(assert (= (and b!152400 (not res!127781)) b!152401))

(assert (=> b!152399 m!238169))

(assert (=> b!152399 m!238053))

(assert (=> b!152401 m!238169))

(assert (=> b!152401 m!238169))

(declare-fun m!238189 () Bool)

(assert (=> b!152401 m!238189))

(assert (=> d!49934 d!50022))

(assert (=> d!49934 d!49960))

(declare-fun d!50024 () Bool)

(declare-fun res!127785 () Bool)

(declare-fun e!101902 () Bool)

(assert (=> d!50024 (=> (not res!127785) (not e!101902))))

(assert (=> d!50024 (= res!127785 (= (size!3074 (buf!3571 lt!238566)) (size!3074 (buf!3571 lt!238566))))))

(assert (=> d!50024 (= (isPrefixOf!0 lt!238566 lt!238566) e!101902)))

(declare-fun b!152402 () Bool)

(declare-fun res!127783 () Bool)

(assert (=> b!152402 (=> (not res!127783) (not e!101902))))

(assert (=> b!152402 (= res!127783 (bvsle (bitIndex!0 (size!3074 (buf!3571 lt!238566)) (currentByte!6512 lt!238566) (currentBit!6507 lt!238566)) (bitIndex!0 (size!3074 (buf!3571 lt!238566)) (currentByte!6512 lt!238566) (currentBit!6507 lt!238566))))))

(declare-fun b!152403 () Bool)

(declare-fun e!101901 () Bool)

(assert (=> b!152403 (= e!101902 e!101901)))

(declare-fun res!127784 () Bool)

(assert (=> b!152403 (=> res!127784 e!101901)))

(assert (=> b!152403 (= res!127784 (= (size!3074 (buf!3571 lt!238566)) #b00000000000000000000000000000000))))

(declare-fun b!152404 () Bool)

(assert (=> b!152404 (= e!101901 (arrayBitRangesEq!0 (buf!3571 lt!238566) (buf!3571 lt!238566) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 lt!238566)) (currentByte!6512 lt!238566) (currentBit!6507 lt!238566))))))

(assert (= (and d!50024 res!127785) b!152402))

(assert (= (and b!152402 res!127783) b!152403))

(assert (= (and b!152403 (not res!127784)) b!152404))

(declare-fun m!238191 () Bool)

(assert (=> b!152402 m!238191))

(assert (=> b!152402 m!238191))

(assert (=> b!152404 m!238191))

(assert (=> b!152404 m!238191))

(declare-fun m!238193 () Bool)

(assert (=> b!152404 m!238193))

(assert (=> d!49934 d!50024))

(assert (=> d!49934 d!49962))

(declare-fun d!50026 () Bool)

(declare-fun res!127788 () Bool)

(declare-fun e!101904 () Bool)

(assert (=> d!50026 (=> (not res!127788) (not e!101904))))

(assert (=> d!50026 (= res!127788 (= (size!3074 (buf!3571 lt!238566)) (size!3074 (buf!3571 thiss!1634))))))

(assert (=> d!50026 (= (isPrefixOf!0 lt!238566 thiss!1634) e!101904)))

(declare-fun b!152405 () Bool)

(declare-fun res!127786 () Bool)

(assert (=> b!152405 (=> (not res!127786) (not e!101904))))

(assert (=> b!152405 (= res!127786 (bvsle (bitIndex!0 (size!3074 (buf!3571 lt!238566)) (currentByte!6512 lt!238566) (currentBit!6507 lt!238566)) (bitIndex!0 (size!3074 (buf!3571 thiss!1634)) (currentByte!6512 thiss!1634) (currentBit!6507 thiss!1634))))))

(declare-fun b!152406 () Bool)

(declare-fun e!101903 () Bool)

(assert (=> b!152406 (= e!101904 e!101903)))

(declare-fun res!127787 () Bool)

(assert (=> b!152406 (=> res!127787 e!101903)))

(assert (=> b!152406 (= res!127787 (= (size!3074 (buf!3571 lt!238566)) #b00000000000000000000000000000000))))

(declare-fun b!152407 () Bool)

(assert (=> b!152407 (= e!101903 (arrayBitRangesEq!0 (buf!3571 lt!238566) (buf!3571 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3074 (buf!3571 lt!238566)) (currentByte!6512 lt!238566) (currentBit!6507 lt!238566))))))

(assert (= (and d!50026 res!127788) b!152405))

(assert (= (and b!152405 res!127786) b!152406))

(assert (= (and b!152406 (not res!127787)) b!152407))

(assert (=> b!152405 m!238191))

(assert (=> b!152405 m!237907))

(assert (=> b!152407 m!238191))

(assert (=> b!152407 m!238191))

(declare-fun m!238195 () Bool)

(assert (=> b!152407 m!238195))

(assert (=> d!49934 d!50026))

(assert (=> b!152284 d!49958))

(declare-fun d!50028 () Bool)

(assert (=> d!50028 (arrayBitRangesEq!0 (buf!3571 thiss!1634) (buf!3571 thiss!1634) lt!238581 lt!238573)))

(declare-fun lt!238758 () Unit!9663)

(declare-fun choose!8 (array!6796 array!6796 (_ BitVec 64) (_ BitVec 64)) Unit!9663)

(assert (=> d!50028 (= lt!238758 (choose!8 (buf!3571 thiss!1634) (buf!3571 thiss!1634) lt!238581 lt!238573))))

(assert (=> d!50028 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238581) (bvsle lt!238581 lt!238573))))

(assert (=> d!50028 (= (arrayBitRangesEqSymmetric!0 (buf!3571 thiss!1634) (buf!3571 thiss!1634) lt!238581 lt!238573) lt!238758)))

(declare-fun bs!12232 () Bool)

(assert (= bs!12232 d!50028))

(assert (=> bs!12232 m!238045))

(declare-fun m!238197 () Bool)

(assert (=> bs!12232 m!238197))

(assert (=> b!152284 d!50028))

(declare-fun b!152408 () Bool)

(declare-fun e!101908 () Bool)

(declare-fun call!2119 () Bool)

(assert (=> b!152408 (= e!101908 call!2119)))

(declare-fun b!152409 () Bool)

(declare-fun e!101910 () Bool)

(assert (=> b!152409 (= e!101910 e!101908)))

(declare-fun c!8147 () Bool)

(declare-fun lt!238759 () tuple4!150)

(assert (=> b!152409 (= c!8147 (= (_3!378 lt!238759) (_4!75 lt!238759)))))

(declare-fun b!152410 () Bool)

(declare-fun e!101907 () Bool)

(declare-fun lt!238761 () (_ BitVec 32))

(assert (=> b!152410 (= e!101907 (byteRangesEq!0 (select (arr!3891 (buf!3571 thiss!1634)) (_4!75 lt!238759)) (select (arr!3891 (buf!3571 thiss!1634)) (_4!75 lt!238759)) #b00000000000000000000000000000000 lt!238761))))

(declare-fun bm!2116 () Bool)

(declare-fun lt!238760 () (_ BitVec 32))

(assert (=> bm!2116 (= call!2119 (byteRangesEq!0 (select (arr!3891 (buf!3571 thiss!1634)) (_3!378 lt!238759)) (select (arr!3891 (buf!3571 thiss!1634)) (_3!378 lt!238759)) lt!238760 (ite c!8147 lt!238761 #b00000000000000000000000000001000)))))

(declare-fun b!152411 () Bool)

(declare-fun res!127793 () Bool)

(assert (=> b!152411 (= res!127793 (= lt!238761 #b00000000000000000000000000000000))))

(assert (=> b!152411 (=> res!127793 e!101907)))

(declare-fun e!101905 () Bool)

(assert (=> b!152411 (= e!101905 e!101907)))

(declare-fun b!152412 () Bool)

(declare-fun e!101909 () Bool)

(assert (=> b!152412 (= e!101909 (arrayRangesEq!369 (buf!3571 thiss!1634) (buf!3571 thiss!1634) (_1!7157 lt!238759) (_2!7157 lt!238759)))))

(declare-fun d!50030 () Bool)

(declare-fun res!127790 () Bool)

(declare-fun e!101906 () Bool)

(assert (=> d!50030 (=> res!127790 e!101906)))

(assert (=> d!50030 (= res!127790 (bvsge lt!238581 lt!238573))))

(assert (=> d!50030 (= (arrayBitRangesEq!0 (buf!3571 thiss!1634) (buf!3571 thiss!1634) lt!238581 lt!238573) e!101906)))

(declare-fun b!152413 () Bool)

(assert (=> b!152413 (= e!101906 e!101910)))

(declare-fun res!127791 () Bool)

(assert (=> b!152413 (=> (not res!127791) (not e!101910))))

(assert (=> b!152413 (= res!127791 e!101909)))

(declare-fun res!127789 () Bool)

(assert (=> b!152413 (=> res!127789 e!101909)))

(assert (=> b!152413 (= res!127789 (bvsge (_1!7157 lt!238759) (_2!7157 lt!238759)))))

(assert (=> b!152413 (= lt!238761 ((_ extract 31 0) (bvsrem lt!238573 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152413 (= lt!238760 ((_ extract 31 0) (bvsrem lt!238581 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152413 (= lt!238759 (arrayBitIndices!0 lt!238581 lt!238573))))

(declare-fun b!152414 () Bool)

(assert (=> b!152414 (= e!101908 e!101905)))

(declare-fun res!127792 () Bool)

(assert (=> b!152414 (= res!127792 call!2119)))

(assert (=> b!152414 (=> (not res!127792) (not e!101905))))

(assert (= (and d!50030 (not res!127790)) b!152413))

(assert (= (and b!152413 (not res!127789)) b!152412))

(assert (= (and b!152413 res!127791) b!152409))

(assert (= (and b!152409 c!8147) b!152408))

(assert (= (and b!152409 (not c!8147)) b!152414))

(assert (= (and b!152414 res!127792) b!152411))

(assert (= (and b!152411 (not res!127793)) b!152410))

(assert (= (or b!152408 b!152414) bm!2116))

(declare-fun m!238199 () Bool)

(assert (=> b!152410 m!238199))

(assert (=> b!152410 m!238199))

(assert (=> b!152410 m!238199))

(assert (=> b!152410 m!238199))

(declare-fun m!238201 () Bool)

(assert (=> b!152410 m!238201))

(declare-fun m!238203 () Bool)

(assert (=> bm!2116 m!238203))

(assert (=> bm!2116 m!238203))

(assert (=> bm!2116 m!238203))

(assert (=> bm!2116 m!238203))

(declare-fun m!238205 () Bool)

(assert (=> bm!2116 m!238205))

(declare-fun m!238207 () Bool)

(assert (=> b!152412 m!238207))

(declare-fun m!238209 () Bool)

(assert (=> b!152413 m!238209))

(assert (=> b!152284 d!50030))

(check-sat (not bm!2108) (not b!152321) (not b!152347) (not bm!2106) (not bm!2107) (not b!152323) (not b!152324) (not d!49964) (not b!152379) (not bm!2114) (not d!50012) (not b!152410) (not b!152413) (not b!152307) (not b!152412) (not b!152399) (not d!50020) (not b!152407) (not b!152391) (not b!152404) (not b!152309) (not b!152402) (not b!152382) (not d!49972) (not b!152401) (not b!152405) (not b!152381) (not d!49968) (not bm!2116) (not d!49982) (not d!50028) (not b!152320) (not b!152393))
(check-sat)
