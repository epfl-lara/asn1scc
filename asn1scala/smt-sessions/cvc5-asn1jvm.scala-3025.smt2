; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70420 () Bool)

(assert start!70420)

(declare-fun b!319063 () Bool)

(declare-fun res!262119 () Bool)

(declare-fun e!229243 () Bool)

(assert (=> b!319063 (=> (not res!262119) (not e!229243))))

(declare-fun i!1041 () (_ BitVec 64))

(declare-fun from!902 () (_ BitVec 64))

(declare-fun at!309 () (_ BitVec 64))

(assert (=> b!319063 (= res!262119 (and (bvsle from!902 i!1041) (bvsle i!1041 at!309)))))

(declare-fun b!319064 () Bool)

(declare-fun res!262120 () Bool)

(assert (=> b!319064 (=> (not res!262120) (not e!229243))))

(declare-datatypes ((array!19885 0))(
  ( (array!19886 (arr!9751 (Array (_ BitVec 32) (_ BitVec 8))) (size!8662 (_ BitVec 32))) )
))
(declare-fun a1!909 () array!19885)

(declare-fun a2!909 () array!19885)

(declare-fun to!869 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!19885 array!19885 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!319064 (= res!262120 (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869))))

(declare-fun res!262123 () Bool)

(assert (=> start!70420 (=> (not res!262123) (not e!229243))))

(assert (=> start!70420 (= res!262123 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!902) (bvsle from!902 to!869) (= (size!8662 a1!909) (size!8662 a2!909)) (bvsle to!869 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8662 a1!909)))) (bvsle from!902 at!309) (bvslt at!309 to!869)))))

(assert (=> start!70420 e!229243))

(assert (=> start!70420 true))

(declare-fun array_inv!8214 (array!19885) Bool)

(assert (=> start!70420 (array_inv!8214 a1!909)))

(assert (=> start!70420 (array_inv!8214 a2!909)))

(declare-fun b!319065 () Bool)

(declare-fun res!262122 () Bool)

(assert (=> b!319065 (=> (not res!262122) (not e!229243))))

(assert (=> b!319065 (= res!262122 (= i!1041 at!309))))

(declare-fun b!319066 () Bool)

(declare-fun res!262121 () Bool)

(assert (=> b!319066 (=> (not res!262121) (not e!229243))))

(assert (=> b!319066 (= res!262121 (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869))))

(declare-fun b!319067 () Bool)

(declare-fun bitAt!0 (array!19885 (_ BitVec 64)) Bool)

(assert (=> b!319067 (= e!229243 (not (= (bitAt!0 a1!909 at!309) (bitAt!0 a2!909 at!309))))))

(assert (= (and start!70420 res!262123) b!319066))

(assert (= (and b!319066 res!262121) b!319063))

(assert (= (and b!319063 res!262119) b!319064))

(assert (= (and b!319064 res!262120) b!319065))

(assert (= (and b!319065 res!262122) b!319067))

(declare-fun m!457265 () Bool)

(assert (=> b!319064 m!457265))

(declare-fun m!457267 () Bool)

(assert (=> start!70420 m!457267))

(declare-fun m!457269 () Bool)

(assert (=> start!70420 m!457269))

(declare-fun m!457271 () Bool)

(assert (=> b!319066 m!457271))

(declare-fun m!457273 () Bool)

(assert (=> b!319067 m!457273))

(declare-fun m!457275 () Bool)

(assert (=> b!319067 m!457275))

(push 1)

(assert (not start!70420))

(assert (not b!319066))

(assert (not b!319067))

(assert (not b!319064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104472 () Bool)

(assert (=> d!104472 (= (array_inv!8214 a1!909) (bvsge (size!8662 a1!909) #b00000000000000000000000000000000))))

(assert (=> start!70420 d!104472))

(declare-fun d!104474 () Bool)

(assert (=> d!104474 (= (array_inv!8214 a2!909) (bvsge (size!8662 a2!909) #b00000000000000000000000000000000))))

(assert (=> start!70420 d!104474))

(declare-fun lt!443502 () (_ BitVec 32))

(declare-datatypes ((tuple4!1298 0))(
  ( (tuple4!1299 (_1!13328 (_ BitVec 32)) (_2!13328 (_ BitVec 32)) (_3!1606 (_ BitVec 32)) (_4!649 (_ BitVec 32))) )
))
(declare-fun lt!443503 () tuple4!1298)

(declare-fun e!229303 () Bool)

(declare-fun b!319140 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319140 (= e!229303 (byteRangesEq!0 (select (arr!9751 a1!909) (_4!649 lt!443503)) (select (arr!9751 a2!909) (_4!649 lt!443503)) #b00000000000000000000000000000000 lt!443502))))

(declare-fun c!15263 () Bool)

(declare-fun lt!443504 () (_ BitVec 32))

(declare-fun call!5982 () Bool)

(declare-fun bm!5979 () Bool)

(assert (=> bm!5979 (= call!5982 (byteRangesEq!0 (select (arr!9751 a1!909) (_3!1606 lt!443503)) (select (arr!9751 a2!909) (_3!1606 lt!443503)) lt!443504 (ite c!15263 lt!443502 #b00000000000000000000000000001000)))))

(declare-fun b!319141 () Bool)

(declare-fun res!262188 () Bool)

(assert (=> b!319141 (= res!262188 (= lt!443502 #b00000000000000000000000000000000))))

(assert (=> b!319141 (=> res!262188 e!229303)))

(declare-fun e!229301 () Bool)

(assert (=> b!319141 (= e!229301 e!229303)))

(declare-fun b!319142 () Bool)

(declare-fun e!229305 () Bool)

(declare-fun e!229304 () Bool)

(assert (=> b!319142 (= e!229305 e!229304)))

(declare-fun res!262187 () Bool)

(assert (=> b!319142 (=> (not res!262187) (not e!229304))))

(declare-fun e!229300 () Bool)

(assert (=> b!319142 (= res!262187 e!229300)))

(declare-fun res!262186 () Bool)

(assert (=> b!319142 (=> res!262186 e!229300)))

(assert (=> b!319142 (= res!262186 (bvsge (_1!13328 lt!443503) (_2!13328 lt!443503)))))

(assert (=> b!319142 (= lt!443502 ((_ extract 31 0) (bvsrem to!869 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!319142 (= lt!443504 ((_ extract 31 0) (bvsrem from!902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1298)

(assert (=> b!319142 (= lt!443503 (arrayBitIndices!0 from!902 to!869))))

(declare-fun b!319143 () Bool)

(declare-fun arrayRangesEq!1803 (array!19885 array!19885 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!319143 (= e!229300 (arrayRangesEq!1803 a1!909 a2!909 (_1!13328 lt!443503) (_2!13328 lt!443503)))))

(declare-fun d!104476 () Bool)

(declare-fun res!262185 () Bool)

(assert (=> d!104476 (=> res!262185 e!229305)))

(assert (=> d!104476 (= res!262185 (bvsge from!902 to!869))))

(assert (=> d!104476 (= (arrayBitRangesEq!0 a1!909 a2!909 from!902 to!869) e!229305)))

(declare-fun b!319144 () Bool)

(declare-fun e!229302 () Bool)

(assert (=> b!319144 (= e!229302 e!229301)))

(declare-fun res!262184 () Bool)

(assert (=> b!319144 (= res!262184 call!5982)))

(assert (=> b!319144 (=> (not res!262184) (not e!229301))))

(declare-fun b!319145 () Bool)

(assert (=> b!319145 (= e!229302 call!5982)))

(declare-fun b!319146 () Bool)

(assert (=> b!319146 (= e!229304 e!229302)))

(assert (=> b!319146 (= c!15263 (= (_3!1606 lt!443503) (_4!649 lt!443503)))))

(assert (= (and d!104476 (not res!262185)) b!319142))

(assert (= (and b!319142 (not res!262186)) b!319143))

(assert (= (and b!319142 res!262187) b!319146))

(assert (= (and b!319146 c!15263) b!319145))

(assert (= (and b!319146 (not c!15263)) b!319144))

(assert (= (and b!319144 res!262184) b!319141))

(assert (= (and b!319141 (not res!262188)) b!319140))

(assert (= (or b!319145 b!319144) bm!5979))

(declare-fun m!457345 () Bool)

(assert (=> b!319140 m!457345))

(declare-fun m!457347 () Bool)

(assert (=> b!319140 m!457347))

(assert (=> b!319140 m!457345))

(assert (=> b!319140 m!457347))

(declare-fun m!457349 () Bool)

(assert (=> b!319140 m!457349))

(declare-fun m!457351 () Bool)

(assert (=> bm!5979 m!457351))

(declare-fun m!457353 () Bool)

(assert (=> bm!5979 m!457353))

(assert (=> bm!5979 m!457351))

(assert (=> bm!5979 m!457353))

(declare-fun m!457355 () Bool)

(assert (=> bm!5979 m!457355))

(declare-fun m!457357 () Bool)

(assert (=> b!319142 m!457357))

(declare-fun m!457359 () Bool)

(assert (=> b!319143 m!457359))

(assert (=> b!319066 d!104476))

(declare-fun d!104490 () Bool)

(assert (=> d!104490 (= (bitAt!0 a1!909 at!309) (not (= (bvand ((_ sign_extend 24) (select (arr!9751 a1!909) ((_ extract 31 0) (bvsdiv at!309 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem at!309 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!27330 () Bool)

(assert (= bs!27330 d!104490))

(declare-fun m!457361 () Bool)

(assert (=> bs!27330 m!457361))

(declare-fun m!457363 () Bool)

(assert (=> bs!27330 m!457363))

(assert (=> b!319067 d!104490))

(declare-fun d!104492 () Bool)

(assert (=> d!104492 (= (bitAt!0 a2!909 at!309) (not (= (bvand ((_ sign_extend 24) (select (arr!9751 a2!909) ((_ extract 31 0) (bvsdiv at!309 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem at!309 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!27331 () Bool)

(assert (= bs!27331 d!104492))

(declare-fun m!457365 () Bool)

(assert (=> bs!27331 m!457365))

(assert (=> bs!27331 m!457363))

(assert (=> b!319067 d!104492))

(declare-fun lt!443511 () (_ BitVec 32))

(declare-fun e!229321 () Bool)

(declare-fun lt!443512 () tuple4!1298)

(declare-fun b!319161 () Bool)

(assert (=> b!319161 (= e!229321 (byteRangesEq!0 (select (arr!9751 a1!909) (_4!649 lt!443512)) (select (arr!9751 a2!909) (_4!649 lt!443512)) #b00000000000000000000000000000000 lt!443511))))

(declare-fun bm!5982 () Bool)

(declare-fun c!15266 () Bool)

(declare-fun lt!443513 () (_ BitVec 32))

(declare-fun call!5985 () Bool)

(assert (=> bm!5982 (= call!5985 (byteRangesEq!0 (select (arr!9751 a1!909) (_3!1606 lt!443512)) (select (arr!9751 a2!909) (_3!1606 lt!443512)) lt!443513 (ite c!15266 lt!443511 #b00000000000000000000000000001000)))))

(declare-fun b!319162 () Bool)

(declare-fun res!262203 () Bool)

(assert (=> b!319162 (= res!262203 (= lt!443511 #b00000000000000000000000000000000))))

(assert (=> b!319162 (=> res!262203 e!229321)))

(declare-fun e!229319 () Bool)

(assert (=> b!319162 (= e!229319 e!229321)))

(declare-fun b!319163 () Bool)

(declare-fun e!229323 () Bool)

(declare-fun e!229322 () Bool)

(assert (=> b!319163 (= e!229323 e!229322)))

(declare-fun res!262202 () Bool)

(assert (=> b!319163 (=> (not res!262202) (not e!229322))))

(declare-fun e!229318 () Bool)

(assert (=> b!319163 (= res!262202 e!229318)))

(declare-fun res!262201 () Bool)

(assert (=> b!319163 (=> res!262201 e!229318)))

(assert (=> b!319163 (= res!262201 (bvsge (_1!13328 lt!443512) (_2!13328 lt!443512)))))

(assert (=> b!319163 (= lt!443511 ((_ extract 31 0) (bvsrem to!869 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!319163 (= lt!443513 ((_ extract 31 0) (bvsrem i!1041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!319163 (= lt!443512 (arrayBitIndices!0 i!1041 to!869))))

(declare-fun b!319164 () Bool)

(assert (=> b!319164 (= e!229318 (arrayRangesEq!1803 a1!909 a2!909 (_1!13328 lt!443512) (_2!13328 lt!443512)))))

(declare-fun d!104494 () Bool)

(declare-fun res!262200 () Bool)

(assert (=> d!104494 (=> res!262200 e!229323)))

(assert (=> d!104494 (= res!262200 (bvsge i!1041 to!869))))

(assert (=> d!104494 (= (arrayBitRangesEq!0 a1!909 a2!909 i!1041 to!869) e!229323)))

(declare-fun b!319165 () Bool)

(declare-fun e!229320 () Bool)

(assert (=> b!319165 (= e!229320 e!229319)))

(declare-fun res!262199 () Bool)

(assert (=> b!319165 (= res!262199 call!5985)))

(assert (=> b!319165 (=> (not res!262199) (not e!229319))))

(declare-fun b!319166 () Bool)

(assert (=> b!319166 (= e!229320 call!5985)))

(declare-fun b!319167 () Bool)

(assert (=> b!319167 (= e!229322 e!229320)))

(assert (=> b!319167 (= c!15266 (= (_3!1606 lt!443512) (_4!649 lt!443512)))))

(assert (= (and d!104494 (not res!262200)) b!319163))

(assert (= (and b!319163 (not res!262201)) b!319164))

(assert (= (and b!319163 res!262202) b!319167))

(assert (= (and b!319167 c!15266) b!319166))

(assert (= (and b!319167 (not c!15266)) b!319165))

(assert (= (and b!319165 res!262199) b!319162))

(assert (= (and b!319162 (not res!262203)) b!319161))

(assert (= (or b!319166 b!319165) bm!5982))

(declare-fun m!457367 () Bool)

(assert (=> b!319161 m!457367))

(declare-fun m!457369 () Bool)

(assert (=> b!319161 m!457369))

(assert (=> b!319161 m!457367))

(assert (=> b!319161 m!457369))

(declare-fun m!457371 () Bool)

(assert (=> b!319161 m!457371))

(declare-fun m!457373 () Bool)

(assert (=> bm!5982 m!457373))

(declare-fun m!457375 () Bool)

(assert (=> bm!5982 m!457375))

(assert (=> bm!5982 m!457373))

(assert (=> bm!5982 m!457375))

(declare-fun m!457377 () Bool)

(assert (=> bm!5982 m!457377))

(declare-fun m!457379 () Bool)

(assert (=> b!319163 m!457379))

(declare-fun m!457381 () Bool)

(assert (=> b!319164 m!457381))

(assert (=> b!319064 d!104494))

(push 1)

(assert (not bm!5979))

(assert (not b!319163))

(assert (not bm!5982))

(assert (not b!319164))

(assert (not b!319142))

(assert (not b!319143))

(assert (not b!319140))

(assert (not b!319161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104518 () Bool)

(declare-fun res!262226 () Bool)

(declare-fun e!229348 () Bool)

(assert (=> d!104518 (=> res!262226 e!229348)))

(assert (=> d!104518 (= res!262226 (= (_1!13328 lt!443503) (_2!13328 lt!443503)))))

(assert (=> d!104518 (= (arrayRangesEq!1803 a1!909 a2!909 (_1!13328 lt!443503) (_2!13328 lt!443503)) e!229348)))

(declare-fun b!319194 () Bool)

(declare-fun e!229349 () Bool)

(assert (=> b!319194 (= e!229348 e!229349)))

(declare-fun res!262227 () Bool)

(assert (=> b!319194 (=> (not res!262227) (not e!229349))))

(assert (=> b!319194 (= res!262227 (= (select (arr!9751 a1!909) (_1!13328 lt!443503)) (select (arr!9751 a2!909) (_1!13328 lt!443503))))))

(declare-fun b!319195 () Bool)

(assert (=> b!319195 (= e!229349 (arrayRangesEq!1803 a1!909 a2!909 (bvadd (_1!13328 lt!443503) #b00000000000000000000000000000001) (_2!13328 lt!443503)))))

(assert (= (and d!104518 (not res!262226)) b!319194))

(assert (= (and b!319194 res!262227) b!319195))

(declare-fun m!457441 () Bool)

(assert (=> b!319194 m!457441))

(declare-fun m!457443 () Bool)

(assert (=> b!319194 m!457443))

(declare-fun m!457445 () Bool)

(assert (=> b!319195 m!457445))

(assert (=> b!319143 d!104518))

(declare-fun d!104520 () Bool)

(assert (=> d!104520 (= (arrayBitIndices!0 i!1041 to!869) (tuple4!1299 ((_ extract 31 0) (bvadd (bvsdiv i!1041 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem i!1041 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!869 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv i!1041 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!869 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!319163 d!104520))

(declare-fun d!104522 () Bool)

(assert (=> d!104522 (= (byteRangesEq!0 (select (arr!9751 a1!909) (_4!649 lt!443503)) (select (arr!9751 a2!909) (_4!649 lt!443503)) #b00000000000000000000000000000000 lt!443502) (or (= #b00000000000000000000000000000000 lt!443502) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a1!909) (_4!649 lt!443503))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443502))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a2!909) (_4!649 lt!443503))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443502))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27336 () Bool)

(assert (= bs!27336 d!104522))

(declare-fun m!457447 () Bool)

(assert (=> bs!27336 m!457447))

(declare-fun m!457449 () Bool)

(assert (=> bs!27336 m!457449))

(assert (=> b!319140 d!104522))

(declare-fun d!104524 () Bool)

(assert (=> d!104524 (= (byteRangesEq!0 (select (arr!9751 a1!909) (_3!1606 lt!443503)) (select (arr!9751 a2!909) (_3!1606 lt!443503)) lt!443504 (ite c!15263 lt!443502 #b00000000000000000000000000001000)) (or (= lt!443504 (ite c!15263 lt!443502 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a1!909) (_3!1606 lt!443503))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15263 lt!443502 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443504)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a2!909) (_3!1606 lt!443503))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15263 lt!443502 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443504)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27337 () Bool)

(assert (= bs!27337 d!104524))

(declare-fun m!457451 () Bool)

(assert (=> bs!27337 m!457451))

(declare-fun m!457453 () Bool)

(assert (=> bs!27337 m!457453))

(assert (=> bm!5979 d!104524))

(declare-fun d!104526 () Bool)

(declare-fun res!262228 () Bool)

(declare-fun e!229350 () Bool)

(assert (=> d!104526 (=> res!262228 e!229350)))

(assert (=> d!104526 (= res!262228 (= (_1!13328 lt!443512) (_2!13328 lt!443512)))))

(assert (=> d!104526 (= (arrayRangesEq!1803 a1!909 a2!909 (_1!13328 lt!443512) (_2!13328 lt!443512)) e!229350)))

(declare-fun b!319196 () Bool)

(declare-fun e!229351 () Bool)

(assert (=> b!319196 (= e!229350 e!229351)))

(declare-fun res!262229 () Bool)

(assert (=> b!319196 (=> (not res!262229) (not e!229351))))

(assert (=> b!319196 (= res!262229 (= (select (arr!9751 a1!909) (_1!13328 lt!443512)) (select (arr!9751 a2!909) (_1!13328 lt!443512))))))

(declare-fun b!319197 () Bool)

(assert (=> b!319197 (= e!229351 (arrayRangesEq!1803 a1!909 a2!909 (bvadd (_1!13328 lt!443512) #b00000000000000000000000000000001) (_2!13328 lt!443512)))))

(assert (= (and d!104526 (not res!262228)) b!319196))

(assert (= (and b!319196 res!262229) b!319197))

(declare-fun m!457455 () Bool)

(assert (=> b!319196 m!457455))

(declare-fun m!457457 () Bool)

(assert (=> b!319196 m!457457))

(declare-fun m!457459 () Bool)

(assert (=> b!319197 m!457459))

(assert (=> b!319164 d!104526))

(declare-fun d!104528 () Bool)

(assert (=> d!104528 (= (arrayBitIndices!0 from!902 to!869) (tuple4!1299 ((_ extract 31 0) (bvadd (bvsdiv from!902 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!902 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!869 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!902 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!869 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!319142 d!104528))

(declare-fun d!104530 () Bool)

(assert (=> d!104530 (= (byteRangesEq!0 (select (arr!9751 a1!909) (_4!649 lt!443512)) (select (arr!9751 a2!909) (_4!649 lt!443512)) #b00000000000000000000000000000000 lt!443511) (or (= #b00000000000000000000000000000000 lt!443511) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a1!909) (_4!649 lt!443512))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443511))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a2!909) (_4!649 lt!443512))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!443511))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27338 () Bool)

(assert (= bs!27338 d!104530))

(declare-fun m!457461 () Bool)

(assert (=> bs!27338 m!457461))

(assert (=> bs!27338 m!457449))

(assert (=> b!319161 d!104530))

(declare-fun d!104532 () Bool)

(assert (=> d!104532 (= (byteRangesEq!0 (select (arr!9751 a1!909) (_3!1606 lt!443512)) (select (arr!9751 a2!909) (_3!1606 lt!443512)) lt!443513 (ite c!15266 lt!443511 #b00000000000000000000000000001000)) (or (= lt!443513 (ite c!15266 lt!443511 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a1!909) (_3!1606 lt!443512))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15266 lt!443511 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443513)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9751 a2!909) (_3!1606 lt!443512))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!15266 lt!443511 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!443513)))) #b00000000000000000000000011111111))))))

(declare-fun bs!27339 () Bool)

(assert (= bs!27339 d!104532))

(declare-fun m!457463 () Bool)

(assert (=> bs!27339 m!457463))

(declare-fun m!457465 () Bool)

(assert (=> bs!27339 m!457465))

(assert (=> bm!5982 d!104532))

(push 1)

(assert (not b!319195))

(assert (not b!319197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

