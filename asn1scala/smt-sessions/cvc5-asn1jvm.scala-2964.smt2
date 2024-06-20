; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69982 () Bool)

(assert start!69982)

(declare-fun b!316442 () Bool)

(declare-fun res!259551 () Bool)

(declare-fun e!227362 () Bool)

(assert (=> b!316442 (=> (not res!259551) (not e!227362))))

(declare-fun mid!82 () (_ BitVec 64))

(declare-datatypes ((array!19513 0))(
  ( (array!19514 (arr!9562 (Array (_ BitVec 32) (_ BitVec 8))) (size!8479 (_ BitVec 32))) )
))
(declare-fun a1!825 () array!19513)

(declare-fun i!1020 () (_ BitVec 64))

(declare-fun a2!825 () array!19513)

(declare-fun arrayBitRangesEq!0 (array!19513 array!19513 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!316442 (= res!259551 (arrayBitRangesEq!0 a1!825 a2!825 i!1020 mid!82))))

(declare-fun b!316443 () Bool)

(declare-fun res!259546 () Bool)

(assert (=> b!316443 (=> (not res!259546) (not e!227362))))

(declare-fun a3!79 () array!19513)

(declare-fun to!845 () (_ BitVec 64))

(assert (=> b!316443 (= res!259546 (arrayBitRangesEq!0 a2!825 a3!79 i!1020 to!845))))

(declare-fun from!878 () (_ BitVec 64))

(declare-fun b!316444 () Bool)

(assert (=> b!316444 (= e!227362 (not (or (bvsgt from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsgt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82) (bvslt (bvsub to!845 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020)) (bvsub to!845 i!1020)))))))

(assert (=> b!316444 (arrayBitRangesEq!0 a2!825 a3!79 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) to!845)))

(declare-datatypes ((Unit!21713 0))(
  ( (Unit!21714) )
))
(declare-fun lt!442941 () Unit!21713)

(declare-fun arrayBitRangesEqDrop1!0 (array!19513 array!19513 (_ BitVec 64) (_ BitVec 64)) Unit!21713)

(assert (=> b!316444 (= lt!442941 (arrayBitRangesEqDrop1!0 a2!825 a3!79 i!1020 to!845))))

(assert (=> b!316444 (arrayBitRangesEq!0 a1!825 a2!825 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020) mid!82)))

(declare-fun lt!442943 () Unit!21713)

(assert (=> b!316444 (= lt!442943 (arrayBitRangesEqDrop1!0 a1!825 a2!825 i!1020 mid!82))))

(assert (=> b!316444 (arrayBitRangesEq!0 a1!825 a3!79 from!878 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!1020))))

(declare-fun lt!442942 () Unit!21713)

(declare-fun arrayBitRangesEqAppend!0 (array!19513 array!19513 (_ BitVec 64) (_ BitVec 64)) Unit!21713)

(assert (=> b!316444 (= lt!442942 (arrayBitRangesEqAppend!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316445 () Bool)

(declare-fun res!259549 () Bool)

(assert (=> b!316445 (=> (not res!259549) (not e!227362))))

(assert (=> b!316445 (= res!259549 (arrayBitRangesEq!0 a2!825 a3!79 from!878 to!845))))

(declare-fun b!316446 () Bool)

(declare-fun res!259550 () Bool)

(assert (=> b!316446 (=> (not res!259550) (not e!227362))))

(assert (=> b!316446 (= res!259550 (arrayBitRangesEq!0 a1!825 a2!825 from!878 mid!82))))

(declare-fun res!259547 () Bool)

(assert (=> start!69982 (=> (not res!259547) (not e!227362))))

(assert (=> start!69982 (= res!259547 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!878) (bvsle from!878 mid!82) (bvsle mid!82 to!845) (= (size!8479 a1!825) (size!8479 a2!825)) (= (size!8479 a2!825) (size!8479 a3!79)) (bvsle mid!82 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8479 a1!825)))) (bvsle to!845 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8479 a2!825))))))))

(assert (=> start!69982 e!227362))

(assert (=> start!69982 true))

(declare-fun array_inv!8031 (array!19513) Bool)

(assert (=> start!69982 (array_inv!8031 a1!825)))

(assert (=> start!69982 (array_inv!8031 a3!79)))

(assert (=> start!69982 (array_inv!8031 a2!825)))

(declare-fun b!316447 () Bool)

(declare-fun res!259552 () Bool)

(assert (=> b!316447 (=> (not res!259552) (not e!227362))))

(assert (=> b!316447 (= res!259552 (and (bvsle from!878 i!1020) (bvsle i!1020 mid!82)))))

(declare-fun b!316448 () Bool)

(declare-fun res!259548 () Bool)

(assert (=> b!316448 (=> (not res!259548) (not e!227362))))

(assert (=> b!316448 (= res!259548 (arrayBitRangesEq!0 a1!825 a3!79 from!878 i!1020))))

(declare-fun b!316449 () Bool)

(declare-fun res!259553 () Bool)

(assert (=> b!316449 (=> (not res!259553) (not e!227362))))

(assert (=> b!316449 (= res!259553 (not (= i!1020 mid!82)))))

(assert (= (and start!69982 res!259547) b!316446))

(assert (= (and b!316446 res!259550) b!316445))

(assert (= (and b!316445 res!259549) b!316447))

(assert (= (and b!316447 res!259552) b!316442))

(assert (= (and b!316442 res!259551) b!316443))

(assert (= (and b!316443 res!259546) b!316448))

(assert (= (and b!316448 res!259548) b!316449))

(assert (= (and b!316449 res!259553) b!316444))

(declare-fun m!454247 () Bool)

(assert (=> b!316444 m!454247))

(declare-fun m!454249 () Bool)

(assert (=> b!316444 m!454249))

(declare-fun m!454251 () Bool)

(assert (=> b!316444 m!454251))

(declare-fun m!454253 () Bool)

(assert (=> b!316444 m!454253))

(declare-fun m!454255 () Bool)

(assert (=> b!316444 m!454255))

(declare-fun m!454257 () Bool)

(assert (=> b!316444 m!454257))

(declare-fun m!454259 () Bool)

(assert (=> b!316446 m!454259))

(declare-fun m!454261 () Bool)

(assert (=> b!316445 m!454261))

(declare-fun m!454263 () Bool)

(assert (=> start!69982 m!454263))

(declare-fun m!454265 () Bool)

(assert (=> start!69982 m!454265))

(declare-fun m!454267 () Bool)

(assert (=> start!69982 m!454267))

(declare-fun m!454269 () Bool)

(assert (=> b!316443 m!454269))

(declare-fun m!454271 () Bool)

(assert (=> b!316448 m!454271))

(declare-fun m!454273 () Bool)

(assert (=> b!316442 m!454273))

(push 1)

(assert (not b!316442))

(assert (not b!316446))

(assert (not b!316443))

(assert (not b!316444))

(assert (not b!316445))

(assert (not b!316448))

(assert (not start!69982))

(check-sat)

(pop 1)

(push 1)

(check-sat)

